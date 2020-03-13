
require(tidyverse)
require(stringr)
require(digest)     # this might not always be required, there might be a better way
 
#
# constants
#
NUM_PREAMBLE <- 6
PRIM_TYPES <- c("integer", "double", "logical", "raw", "character", "complex")
# this is the new preamble
PREAMBLE <- c("package_being_analyzed","package","fun_name","fun_id","trace_hash","type_hash","dispatch","count")
# PREAMBLE <- c("package_being_analyzed", "package", "fun_name", "fun_id", "trace_hash", "count")
PREAMBLE_WITH_TYPES_HASH <- c("package_being_analyzed", "package", "fun_name", "fun_id", "trace_hash", "types_hash", "count")
PREAMBLE_TYPES <- c("c", "c", "c", "c", "i", "i") # using compact representation
NAMES_REMOVED <- T


#
# code
#
preprocess_file_build_header <- function(file_name) {
    # get lines from file
    fc <- file(file_name)
    lines <- readLines(fc)
    close(fc)

    # split all by ", "
    lapply(lines, function(x) strsplit(x, split=",")) %>%
    lapply(unlist) %>% 
    sapply(length) -> lengths

    max(lengths) -> max_len

    max_num_args <- (max_len - NUM_PREAMBLE) / 3

    # build new row for beginning
    new_first_row <- paste(PREAMBLE, collapse=",")
    new_first_row <- c(
        new_first_row, 
        c("arg_t_r", "arg_c_r", "arg_a_r"),
        mapply(function(x, y) paste(x, y, sep=""), 
               rep(c("arg_t", "arg_c", "arg_a"), max_num_args - 1), 
               rep(seq_len(max_num_args - 1) - 1, each=3))) %>%
    (function(x) {paste(x, collapse=",")})
    
    # note: -1, return, is first

    fc <- file(file_name)
    writeLines(c(new_first_row, lines), fc)
    close(fc)

    sum((lengths - NUM_PREAMBLE) %% 3) == 0
}

# good pattern: "(?<=\\{).*?(?=\\})"
# Command:
#
# read_csv(...) %>% replace_NAs %>% df_remove_curlies %>% df_strings_to_lists %>% df_collapse_by_fn_id
# (and %>% df_strings_to_lists(start_ind=2) if you want lists)
generate_init_dependency_file <- function(file_name) {
    read_csv(file_name) %>%
    replace_NAs %>%
    df_remove_curlies %>%
    df_strings_to_lists %>%
    df_collapse_by_fn_id %>%
    df_strings_to_lists(start_ind = 4) %>%
    df_to_list_of_dep_inits -> write_me

    write_me
    # TODO: generate the outfile name?
}

# replace NAs as appropriate:
# for types, just put ""
# for classes and attrs, put "{}""
replace_NAs <- function(df) {
    num_args_to_gen <- (ncol(df) - NUM_PREAMBLE) / 3 - 1

    dyn_col_names <- c(
        c("arg_t_r", "arg_c_r", "arg_a_r"), 
        mapply( function(x, y) paste(x, y, sep=""), 
        rep(c("arg_t", "arg_c", "arg_a"), num_args_to_gen), 
        rep(seq_len(num_args_to_gen), each=3) - 1) %>% unname)

    df_r <- df

    type_col_names <- dyn_col_names[seq(1, length(dyn_col_names), by=3)]
    other_col_names <- setdiff(dyn_col_names, type_col_names)

    names(type_col_names) <- type_col_names
    names(other_col_names) <- other_col_names

    replace_na(df_r, lapply(type_col_names, function(x) "")) %>%
    replace_na(lapply(other_col_names, function(x) "{}"))
}

df_remove_curlies <- function(df) {
    df_r <- df

    extract_list <- names(df)
    extract_list <- extract_list[(NUM_PREAMBLE + 1):length(extract_list)]
    extract_list <- extract_list[setdiff(seq_len(length(extract_list)), seq(1, length(extract_list), 3))]

    for (i in 1:length(extract_list)) {
        # note: need !!sym(col_names[i]) for dumb shite
        df_r %>% mutate(!!extract_list[i] := str_extract(!!sym(extract_list[i]), "(?<=\\{).*?(?=\\})")) -> df_r
    }

    df_r # return
}

df_strings_to_lists <- function(df, start_ind = NUM_PREAMBLE + 1) {
    # first, remove the {}s
    df_r <- df

    extract_list <- names(df)
    extract_list <- extract_list[start_ind:length(extract_list)]

    for (i in 1:length(extract_list)) {
        # while we're here... lets turn the column into a list
        df_r %>% mutate(!!extract_list[i] := strsplit(!!sym(extract_list[i]), split=",")) -> df_r 
    }

    df_r # return
}

# this one is very slow
# this is the function that will give you the collapsed tibble
df_collapse_by_fn_id <- function(df) {
    df_r <- df

    extract_list <- names(df)
    extract_list <- extract_list[(NUM_PREAMBLE + 1):length(extract_list)]

    # TODO: we lose the counts here...
    df_r %<>% group_by(package, fun_name, fun_id) %>%
              summarize_at(extract_list, function(x) {
                paste(union(x, c()), collapse=",")
              })

    # unfortunately, there are character(0) strings inside the results.
    # lets get rid of them
    df_r %<>% rowwise %>% mutate_at(extract_list, function(x) {

        # dunno if removing NAs make sense here, b/c it signifies that
        # those arguments were not present
        x_s <- strsplit(x, split="character\\(0\\)") %>%
        unlist %>%
        paste(collapse="") %>%
        str_replace(pattern=",,", replacement=",")

        if (substr(x_s, 1, 1) == ",")
            x_s <- substr(x_s, 2, nchar(x_s))
        else if (substr(x_s, nchar(x_s), nchar(x_s)) == ",")
            x_s <- substr(x_s, 1, nchar(x_s)-1)

        x_s
    })

    df_r
}

#
#

df_to_list_of_dep_inits <- function(df, start_index = NUM_PREAMBLE) {
    
    inds_to_search <- seq(start_index, ncol(df), 3)
    r <- apply(df, 1, function(row) {
        fn_id <- row["fun_id"]
        types <- row[inds_to_search]
        pposes <- -1:(length(inds_to_search)-2)

        mapply(function(ppos, type) {
            if (length(type) > 0)
                paste(paste(fn_id, ppos, sep=","), paste(type, collapse=","), sep=" : ")
            else
                ""
        }, pposes, types) -> the_strings

        build_me <- paste(the_strings[nchar(the_strings) != 0], collapse="\n")
    }) %>% paste(collapse="\n")
    
    r 
}

#
# main function
# call from scripts
#
gen_init_deps_for_package <- function(pkg, path_to_res = "results") {

    path_into_pkg <- paste(path_to_res, pkg, sep="/")

    type_of_files_analyzed <- list.files(path_into_pkg, full.names=T)

    sapply(type_of_files_analyzed, function(path) {
        files_for_type <- list.files(path)
        
        trace_files <- files_for_type[sapply(files_for_type, function(x) grepl("traces_", x, fixed=T))]

        write_us <- sapply(paste(path, trace_files, sep="/"), generate_init_dependency_file)

        # write the contents
        # generate names to write to
        # dependency_init_FILE.ext
        write_out_names <- strsplit(trace_files, split="_") %>% sapply(function(l) {
            paste("dependency_init_", l[2:length(l)], sep="")
        })

        mapply(function(out_file_name, write_out_data) {
            fc <- file(paste(path, out_file_name, sep="/"))
            writeLines(write_out_data, fc)
            close(fc)
        }, write_out_names, write_us)
    })

}

# generate string of signatures to be written out to file
generate_all_signatures <- function(df) {
    apply(df, 1, function(row) {
        smaller_row <- row[c(-1, -2, -4, -5)] # TODO hardcoded
        smaller_row <- smaller_row[!sapply(smaller_row, is.na)]
        lapply(smaller_row, function(el) {
            el
        }) %>% paste(collapse=",")
    }) %>% paste(collapse="\n")
}

# grab all files and get base package functions
get_all_base_in_dir <- function(dir) {

    all_files <- list.files(dir, full.names=T, recursive=T)

    trace_files <- all_files[grep("traces_", all_files, fixed=T)]

    # read_csv
    Reduce(function(x, y) {
        bound <- bind_rows(read_csv(y), x)
        bound %>%
        filter(package=="base") %>%
        group_by_at(setdiff(names(bound), "count")) %>%
        summarize(count=sum(count)) %>%
        ungroup
    }, trace_files, data.frame())
    # get base funs
    # bind 
    # group and summarize

}

# To be performed on rows of a data frame
old_check_sig_equality_for_dispatch <- function(row1, row2) {
    names_to_check <- setdiff(names(row1), PREAMBLE)

    (row1 %>% select(names_to_check) == row2 %>% select(names_to_check)) %>% reduce(`&&`)
}

old_remove_dispatch <- function(df, dispatch_name, base_name) {

    names_to_check <- setdiff(names(df), PREAMBLE)

    dispatch_rows <- df %>% filter(fun_name == dispatch_name)
    dispatch_strs <- dispatch_rows %>% apply(1, function(r) paste(r[names_to_check], collapse=","))

    base_rows <- df %>% filter(fun_name == base_name)
    base_strs <- base_rows %>% apply(1, function(r) paste(r[names_to_check], collapse=","))

    # now, we want to uncount the dispatch cases
    # note: we can use the trace_hash to find the rows that we're interested in
    base_rows_of_interest <- base_rows[base_strs %in% dispatch_strs, ]
    # dispatch_rows_of_interest <- dispatch_rows[dispatch_strs %in% base_strs, ]

    # line them up...
    # this needs to be done with this stupid string hack...
    base_rows_of_interest <- base_rows_of_interest[order(base_strs[base_strs %in% dispatch_strs]),]
    # dispatch_rows_of_interest <- dispatch_rows_of_interest[order(dispatch_strs[dispatch_strs %in% base_strs]),]

    # modify row counts << IN df >>, subtracting the dispatch #s from the base #s
    all_strs <- df %>% apply(1, function(r) paste(r[setdiff(names(r), "count")], collapse=","))
    base_strs_but_with_more <- base_rows_of_interest %>% apply(1, function(r) paste(r[setdiff(names(r), "count")], collapse=","))
    
    # most awful line of code ever written
    df[all_strs %in% base_strs_but_with_more, ][order(all_strs[all_strs %in% base_strs_but_with_more]),]$count <- 
    df[all_strs %in% base_strs_but_with_more, ][order(all_strs[all_strs %in% base_strs_but_with_more]),]$count -
    base_rows_of_interest[base_strs_but_with_more %in% all_strs,][order(base_strs_but_with_more[base_strs_but_with_more %in% all_strs]),]$count

    # remove the now 0-count rows
    df %>% filter(count > 0)
}

# TODO: copy paste basically of above, except the beginning is slightly different
old_remove_fun_redefs <- function(df, target_package, og_package, the_fun_name) {
    names_to_check <- setdiff(names(df), PREAMBLE)

    dispatch_rows <- df %>% filter(fun_name == the_fun_name, package == target_package)
    dispatch_strs <- dispatch_rows %>% apply(1, function(r) paste(r[names_to_check], collapse=","))

    base_rows <- df %>% filter(fun_name == the_fun_name)
    base_strs <- base_rows %>% apply(1, function(r) paste(r[names_to_check], collapse=","))

    base_rows_of_interest <- base_rows[base_strs %in% dispatch_strs, ]
    base_rows_of_interest <- base_rows_of_interest[order(base_strs[base_strs %in% dispatch_strs]),]

    all_strs <- df %>% apply(1, function(r) paste(r[setdiff(names(r), "count")], collapse=","))
    base_strs_but_with_more <- base_rows_of_interest %>% apply(1, function(r) paste(r[setdiff(names(r), "count")], collapse=","))

    df[all_strs %in% base_strs_but_with_more, ][order(all_strs[all_strs %in% base_strs_but_with_more]),]$count <- 
    df[all_strs %in% base_strs_but_with_more, ][order(all_strs[all_strs %in% base_strs_but_with_more]),]$count -
    base_rows_of_interest[base_strs_but_with_more %in% all_strs,][order(base_strs_but_with_more[base_strs_but_with_more %in% all_strs]),]$count

    df %>% filter(count > 0)
}

# TODO do we want pkg?
# TODO: I think we can run this in parallel, before combining. Think abt this.
remove_dispatch_for_fun <- function(df, fun) { #, pkg="base") {
    # sanitize fun for regex
    unames <- df %>% select(fun_name) %>% unique
    S3_dispatch_names <- unames[unames %>% map(function(e) grepl(pattern = paste(fun, ".", sep=""), e, fixed=T)) %>% unlist %>% unname, ] %>% unlist %>% unname

    dispatch_rows <- df %>% filter(fun_name %in% S3_dispatch_names)
    og_rows <- df %>% filter(fun_name == fun)

    # TODO: for each og_row, remove matching dispatch row
    candidates_for_purge <- intersect(og_rows$types_hash, dispatch_rows$types_hash)

    # Want to remove all rows in og_rows with types_hash in candidates_for_purge.
    df %>% anti_join(
        df %>% filter(fun_name == fun) %>% filter(types_hash %in% candidates_for_purge),
        by = "types_hash"
    )
}

quick_pred_is_S3_dispatch <- function(df) {
    # Is there a way to reliably detect S3 dispatch?
    length(make_dispatch_candidate_sets(df)) > 0
}

read_header_from_path <- function(path) {
    f <- file(path)
    l <- readLines(f)
    l <- strsplit(l, ",")[[1]]
    close(f)

    # Return
    l 
}



remove_dispatch_for_all_funs <- function(df, lof) {
    # Scary for loop...
    for (n in lof) {
        df <- remove_dispatch_for_fun(df, n)
    }

    df # return
}

# These aren't all dispatch, but the next stage benefits from this paring down.
# Some information we compute here isn't strictly necessary right now, but it might
# be helpful if removing dispatch still proves to be inefficient.
#
# TODO: Worth double-checking if this can be smarter.
make_dispatch_candidate_sets <- function(df) {
    unames <- df %>% select(fun_name) %>% unique %>% unlist %>% unname
    potential_dispatch_names <- unames[grepl("\\.", unames)]

    # So: it's gonna be the a.b.cs s.t. \exists a.b somewhere
    # base_fun_names <- setdiff(unames, potential_dispatch_names)

    # Grab all but the last. a.b from a.b.c, for example.
    base_fun_names <- map(unames, function(un) {
        split <- strsplit(un, split="\\.")[[1]]
        if (length(split) == 1) {
            # no point considering -- if it could be a base_fun_name, it'll
            # show up as base_fun_name.<dispatch on...>
            ""
        } else {
            paste(split[1:length(split)-1], collapse=".")
        }
    })

    base_fun_names <- base_fun_names[base_fun_names != ""] %>% unique

    intersect(base_fun_names, unames)
}

make_S4_dispatch_candidate_sets <- function(df) {
    # Assuming there's S4 dispatch happening.
    # Get rows that have S4 stuff.
    key_dispatch_rows <- df %>% get_S4_rows %>% 

    # TODO: check that this always works.
    # Filter out rows for base and methods package calls.
    filter(!(package == "base" | package == "methods"))

    # Now, we want to remove the double counting.
    # We can do that by looking at the function IDs.
    # Need to find the base ID of the function itself.
    uIDs <- key_dispatch_rows %>% select(fun_id) %>% unique %>% unlist %>% unname

    # Ok. One of the TOTAL COUNTS will be half of all total counts.
    # Get per-uID counts.
    counts_per_uID <- key_dispatch_rows %>% group_by(fun_id) %>% summarize(count = sum(count))

    tot_count <- counts_per_uID %>% select(count) %>% sum

    base_fun_id <- counts_per_uID %>% filter(count == tot_count / 2) %>% select(fun_id) %>% unlist %>% unname

    # We can get rid of the rows with the base fun ID, because they appear in the data 
    # through their dispatch cases. 
    # If we are still interested in consolidating the data, maybe we can create "groups" of
    # functions that share a base method.
    # Return:
    df %>% filter(! fun_id == base_fun_id)
}

# TODO: S4 Dispatch
old_deal_with_dispatch <- function(df, base_fun_name, base_package="base") {
    u_fun_names <- df %>% select(fun_name) %>% unique %>% unlist %>% unname

    # for returning
    df_r <- df

    # ok, there are TWO cases we might want to consider here... are there?

    # 1. entirely different function names e.g. +.CLASS
    for (n in setdiff(u_fun_names, base_fun_name)) {
        df_r <- remove_dispatch(df_r, n, base_fun_name)
    }

    # 2. the same function, redefined in another package
    package_names <- df %>% select(package) %>% unique %>% unlist %>% unname

    for (p in setdiff(package_names, base_package)) {
        df_r <- remove_fun_redefs(df_r, p, base_package, base_fun_name)
    }

    # return
    df_r
}

# easy processor for base package functions
results_for_base_fun <- function(base_fun_name, dir="~/results_1000") {
    lof <- list.files(dir, full.names=T)

    # debug
    lof <- head(lof, 2)

    Reduce(function(x, y) {
        combo_df <- bind_rows(x, filter(get_all_base_in_dir(y), fun_name==base_fun_name))
        combo_df[,colSums(is.na(combo_df))<nrow(combo_df)]
    }, lof, data.frame())

}

# extract the dimensions from a given type
extract_dim_from_type <- function(t) {
    r <- sub("\\].*", "", sub(".*\\[", "", remove_tags_from_type(t)))
    if (r == t)
        NA
    else
        r
}

extract_dims_from_type_list <- function(lot) {
    r <- map(lot, function(t) {
        t %>% extract_dim_from_type
    }) %>% unname %>% unlist

    r[!is.na(r)]
}

remove_full_NA_cols <- function(df) {
    df[,colSums(is.na(df))<nrow(df)]
} 

# TODO: take advantage of flows to track more than just type?
# e.g. if we can link arguments with returns

make_names_for_dims <- function(dims) {
    # TODO finish alphabet
    alphabet <- c("a", "b", "c", "d", "e", "f", "g", "h", "i")

    alphabet[1:length(dims)]
}

replace_dim <- function(t, replacements) {
    t_s <- strsplit(t, split="@", fixed=T)[[1]]

    type <- substr(t_s[1], 1, nchar(t_s[1])-1)
    type_s <- strsplit(type, split="[", fixed=T)[[1]]
    the_dim <- strsplit(type_s[2], split="-", fixed=T)[[1]]

    if (length(the_dim) == 1) { # if vector,
        type <- paste(type_s[1], replacements[[the_dim]], sep="[")
    } else { # else if matrix
        the_dim <- sapply(the_dim, function(d) {
            if (d %in% names(replacements))
                replacements[[d]]
            else
                d
        })
        type <- paste(type_s[1], paste(the_dim, collapse="-"), sep="[")
    }
    t_s[1] <- paste(type, "]", sep="")

    paste(t_s, collapse="@")
}

has_dim <- function(t) {
    length(strsplit(t, split="[", fixed=T)[[1]]) > 1
}

# TODO: we want to know when we should incorporate the class in the type


# TODO incorporate rudimentary subtyping
# TODO not resilient to rows with different lengths
crunch_trace <- function(t) {
    # 1. collect all types in trace
    #    works best on tagless types
    tnames <- names(t)
    tnames <- tnames[grep("_t", tnames)]

    types <- as.list(t[tnames])
    types <- types[!is.na(types)]

    # save tags
    split <- lapply(types, function(x) strsplit(x, "@", fixed=T)[[1]])

    types <- lapply(split, function(x) x[1])

    # transform PRIM[i] into PRIM
    scalar_inds <- types %in% paste(PRIM_TYPES, "[1]", sep="")
    types[scalar_inds] <- substr(types[scalar_inds], 0, nchar(types[scalar_inds]) - 3) 

    #
    #   TODO -- do lists and data.frames, not just primitives
    #        -- do matrix dim logic for vectors also
    #

    # this crunches the return ~ argument length dependency
    # if (strsplit(types[[1]], "[", fixed=T)[[1]][1] %in% PRIM_TYPES) {
    if (extract_dims_from_type_list(types) %>% length >= 1) {
        # new logic based primarily on the dimensions
        # we know that the return type is a primitive vec of some sort
        # all_dims <- lapply(types, extract_dim_from_type)
        all_dims <- extract_dims_from_type_list(types)

        split_dims <- map(all_dims, function(s) strsplit(s, split="-")[[1]])
        #if (split_dims %>% map(length) %>% reduce(`+`) != length(split_dims)) {
            # there's a matrix
            udims <- split_dims %>% reduce(c) %>% unique
            var_name_replacements <- make_names_for_dims(udims)
            names(var_name_replacements) <- udims

            types[sapply(types, has_dim)] <- sapply(types[sapply(types, has_dim)], function(t) {
                replace_dim(t, var_name_replacements)
            })
        #} else {
        #    # no matrices, simple case
        #    if (all_dims[[1]] %in% all_dims[2:length(all_dims)]) {
        #        types[all_dims == all_dims[[1]]] <- sapply(types[all_dims == all_dims[[1]]], function(t) {
        #            # TODO: make work for matrices by checking the dimension
        #            #       needs more parsing...
        #            paste(strsplit(t, "[", fixed=T)[[1]][1], "[n]", sep="")
        #        })
        #    }
        #}
    }

    types <- mapply(function(t, s) {
        s[1] <- t
        paste(s, collapse="@")
    }, types, split)

    types
}

# crunch a data frame of traces down to a data frame of signatures
# DOES NOT PLAY WELL WITH ROWS OF DIFFERENT LENGTH
crunch_sigs <- function(df_t) {
    # 1. transform the types?
    # TODO: will turn dimensions into n?
    # TODO: other whole sig transformations...
    type_names <- names(df_t)
    type_names <- type_names[grep("_t", type_names, fixed=T)]

    # NOTE t for transpose
    df_t[type_names] <- t(apply(df_t[type_names], 1, function(r) {
        crunch_trace(r)
    }))

    df_t

}

######################################################
#
# Functions for transforming types.
#

make_class_type_trace <- function(t) {
    # do it for one trace
    classes <- t[grepl("_c", names(t), fixed=T)]
    classes <- substr(classes, 2, nchar(classes) - 1)
    type_inds <- grep("_t", names(t), fixed=T)

    t[type_inds[classes != ""]] <- classes[classes != ""]

    # t[grepl("_t", names(t)[nchar(t[grepl("_c", names(t), fixed=T)]) > 2], fixed=T)] <- substr(t[grepl("_c", names(t)[nchar(t[grepl("_c", names(t), fixed=T)]) > 2], fixed=T)], 2, nchar(t[grepl("_c", names(t)[nchar(t[grepl("_c", names(t), fixed=T)]) > 2], fixed=T)]) - 1)

    t
}

make_class_type_whole_df <- function(df) {
    # map(df, make_class_type_trace) %>% as_tibble

    df_r <- t(apply(df, 1, make_class_type_trace))

    df_r <- as_tibble(df_r)

    # the approach above turns numeric columns into character columns, fix that
    df_r$count <- as.double(df_r$count)
    if ("trace_hash" %in% names(df_r))
        df_r$trace_hash <- as.double(df_r$trace_hash)

    df_r
}

# also remove environment names! TODO
remove_tags_from_type <- function(ty, except_function_tags=T) {
    if (!NAMES_REMOVED) # TODO this wont work actually
        the_split <- strsplit(strsplit(ty, "@", fixed=T)[[1]][1], split="{", fixed=T)[[1]]
    else 
        the_split <- strsplit(ty, "@", fixed=T)[[1]]

    if (except_function_tags && the_split[1] %in% c("closure", "builtin", "special")) {
        paste(the_split[1], the_split[2], sep="@")
    } else {
        the_split[1]
    }
}

remove_all_tags_from_df <- function(df, except_function_tags=T) {
    df[,names(df)[grep("_t", names(df))]] <- map(df[,names(df)[grep("_t", names(df))]], function(lot) {
        map(lot, function(t) remove_tags_from_type(t, except_function_tags)) %>% unlist
    })

    df
}

remove_dimensions_from_type <- function(ty) {
    strsplit(ty, "[", fixed=T)[[1]][1]
}

transform_dimension_to_scalar_vector <- function(ty) {
    ty_split_tags <- strsplit(ty, "@", fixed=T)[[1]]

    tagless_ty <- ty_split_tags[1]
    split_ty <- strsplit(substr(tagless_ty, 1, nchar(tagless_ty)-1), split="\\[")[[1]]

    # is it a matrix?
    if (length(strsplit(split_ty[2], split=",")[[1]]) == 2) {
        # it is a matrix, forget about it?
        ty_split_tags[1] <- paste("m", split_ty[1], sep="/")
        return(paste(ty_split_tags, collapse="@"))
    }

    if (as.integer(split_ty[2]) == 1) {
        ty_split_tags[1] <- paste("s", split_ty[1], sep="/")
        return(paste(ty_split_tags, collapse="@"))
    }
    else if (!is.na(as.integer(split_ty[2]))) {
        ty_split_tags[1] <- paste("v", split_ty[1], sep="/")
        return(paste(ty_split_tags, collapse="@"))
    }
    else
        return(ty)
}

# lot : list of tagless types
consolidate_dimension_types <- function(lot) {
    pred <- function(t) {
        length(strsplit(t, "[", fixed=T)[[1]]) > 1
    }

    # dim_types will have the types which have dimensions
    dim_types <- lot[sapply(lot, pred)]

    # we should now consolidate them if we can

}

#
#
#
######################################################

# ???
# TODO: unhardcode this
extract_and_save_base_fun <- function(df, a_fun_name) {
    file_part <- a_fun_name
    if (grepl("/", a_fun_name, fixed=T)) {
        file_part <- str_replace(a_fun_name, "/", "slash")
    }

    df %>% filter(fun_name == a_fun_name) %>% write_csv(paste("~/base_only_1000/base_", file_part, ".csv", sep=""))

    invisible(TRUE)
}

######################################################
#
# Functions for consolidating/minimizing data
#

# remove environment {...} stuff
remove_env_names_from_line <- function(l) {
    # gsub("environment\\{((?!\\}).)*?\\}", "environment", l, perl=T)
    gsub("environment\\{[^\\}]*\\}", "environment", l, perl=T)
}

# clean (version >= 2.2) and \n stuff from package list
# for ECOOP experiments
clean_imports_from_avail_pkgs <- function(s) {
    gsub("\n", "", gsub("\\([^\\)]*\\)", "", s, perl=T))
}

split_imports_list <- function(l) {
    map(l, clean_imports_from_avail_pkgs) %>%
    map(function(s) {strsplit(s, ",")[[1]] %>% map(str_trim) %>% unlist})
}

generate_header_for_num_args <- function(n) {
    dyn_col_names <- c(
        c("arg_t_r", "arg_c_r", "arg_a_r"), 
        mapply( function(x, y) paste(x, y, sep=""), 
        rep(c("arg_t", "arg_c", "arg_a"), n), 
        rep(seq_len(n), each=3) - 1) %>% unname)

    c(PREAMBLE, dyn_col_names)
}

# 476 in big df now
generate_col_names_for_count <- function(ct) {
    num_to_gen <- (ct - NUM_PREAMBLE) / 3 - 1 # - 1 for return

    dyn_col_names <- c(
        c("arg_t_r", "arg_c_r", "arg_a_r"), 
        mapply( function(x, y) paste(x, y, sep=""), 
        rep(c("arg_t", "arg_c", "arg_a"), num_to_gen), 
        rep(seq_len(num_to_gen), each=3) - 1) %>% unname)

    c(PREAMBLE, dyn_col_names)
}

make_and_minimize_base_df <- function(path_to_csv, col_names) {
    df <- read_csv(path_to_csv, col_names = col_names)

    df %>%
    group_by_at(setdiff(col_names, "count")) %>%
    summarize(count=sum(count))
}

big_csv_get_col_names <- function(path) {
    # get the lines
    f <- file(path)
    lines <- readLines(f)
    close(f)

    # find biggest line
    max <- max(sapply(lines, function(l) { length(strsplit(l, split=",")[[1]]) }))

    max
}

big_csv_get_all_row_lengths <- function(path) {
    f <- file(path)
    lines <- readLines(f)
    close(f)

    map(lines, function(l) { length(strsplit(l, split=",")[[1]]) })
}

bind_many_dfs <- function(dfs) {

    while(length(dfs) > 1) {

        dfs1 <- dfs[seq(1, length(dfs), 2)]
        dfs2 <- dfs[seq(2, length(dfs), 2)]

        # PAD
        if (length(dfs1) > length(dfs2)) {
            dfs2[[length(dfs1)]] <- data.frame()
        } else if (length(dfs2) > length(dfs1)) {
            dfs1[[length(dfs2)]] <- data.frame()
        }
        
        dfs <- mapply(function(df1, df2) {
            b <- bind_rows(df1, df2)

            b %>%
            group_by_at(setdiff(names(b), "count")) %>%
            summarize(count=sum(count)) %>%
            ungroup
        }, dfs1, dfs2, SIMPLIFY=F)

    }

    # postprocess
    dfs[[1]]
}

bind_many_dfs_bad <- function(dfs) {
    tot_rows <- Reduce(`+`, sapply(dfs, nrow))
    max_cols <- max(sapply(dfs, ncol))
    names_of_max_col <- names(dfs[sapply(dfs, ncol) == max_cols][[1]]) # [[1]] gets first of many
    
    # make a df of the appropriate size
    df <- setNames(data.frame(matrix(ncol=max_cols, nrow=tot_rows)), names_of_max_col)

    # very inefficient
    r <- 1
    for (i in 1:length(dfs)) {
        this_df <- dfs[[i]]
        for (j in 1:nrow(dfs[[i]])) {
            df[r,] <- this_df[j,]
            cat("working...", r)
            r <- r + 1
        }
    }

    as_tibble(df) # return
}

# Jan 7 -- 6015 is how many columns there should be atm?
generate_col_types_for_count <- function(num_args, tot_cols) {
    # "-" is skip
    pre_compact <- paste(PREAMBLE_TYPES, collapse="")
    arg_compact <- paste(rep("c", 3*num_args), collapse="")
    how_many_to_ignore <- tot_cols - NUM_PREAMBLE - 3*num_args
    ign_compact <- paste(rep("-", how_many_to_ignore), collapse="")

    paste(pre_compact, arg_compact, ign_compact, sep="")
}

collapse_package_sources_to_count <- function(df) {
    df$num_packages_called_from <- rep(1, nrow(df))

    pre <- c(setdiff(PREAMBLE, "package_being_analyzed"), "num_packages_called_from")
    post <- setdiff(names(df), PREAMBLE_WITH_TYPES_HASH)

    df %>% group_by(trace_hash) %>% mutate(num_packages_called_from = sum(num_packages_called_from)) %>%
      select(c(pre, post))
}

#
#
# Quick Transformation Functions
# Should just take the data.frame.
#

quick_group <- function(df) {

    rm_me <- c("count")
    if ("trace_hash" %in% names(df))
        rm_me <- c(rm_me, "trace_hash")

    select_me <- setdiff(PREAMBLE, "trace_hash")
    select_me <- select_me[select_me %in% names(df)]

    df %>% group_by_at(setdiff(names(df), rm_me)) %>%
           summarize(count=sum(count)) %>%
           ungroup %>%
           # reorder
           select(select_me, everything())
}

quick_simplify_types <- function(df) {
    df %>% mutate_at(vars(starts_with("arg_t")), .funs = list(. = ~  str_extract(., "[^\\[]*"))) %>%
           mutate_at(vars(starts_with("arg_t")), .funs = list(. = ~  str_extract(., "[^@]*"))) 
}

quick_trim_na_cols <- function(df) {
    not_all_na <- function(x) {!all(is.na(x))}
    df %>% select_if(not_all_na)
}

quick_remove_tags <- function(df, except_function_tags=T) {
    remove_all_tags_from_df(df, except_function_tags)
}

quick_type_cols_only <- function(df) {
    col_names_for_types <- names(df)[grepl("_t", names(df), fixed=T)]

    df %>% select(c("package_being_analyzed", "package", "fun_name", "count", col_names_for_types))
}

quick_type_and_class_cols_only <- function(df) {
    col_names_for_types <- names(df)[grepl("_t|_c", names(df), fixed=F)]

    df %>% select(c("package_being_analyzed", "package", "fun_name", "count", col_names_for_types))
}

quick_crunch <- function(df_m) {
    df_m %>% quick_trim_na_cols %>% quick_remove_tags %>% crunch_sigs %>% quick_group
}

quick_remove_dims <- function(df) {
    col_names_for_types <- names(df)[grepl("_t", names(df), fixed=T)]

    df[, col_names_for_types] <- df[, col_names_for_types] %>% map(function(l) map(l, function(t) remove_dimensions_from_type(t)) %>% unlist)

    df
}

# I suppose this can be run in parallel before combining everything
quick_add_type_digest <- function(df) {
    # Compute the digest.
    # First, get names of columns for digest.
    cols_we_want <- names(df)[grepl("arg", names(df))]
    digests <- df[, cols_we_want] %>% rowwise %>% do(row = digest(.)) %>% unlist %>% unname

    # Put it in df.
    df$types_hash <- digests

    pre_here <- intersect(PREAMBLE, names(df))

    # Reorder df and return.
    df[, c(pre_here, "types_hash", setdiff(names(df), c(pre_here, "types_hash")))]
}

quick_trim_df_to_x_args <- function(df, how_many = 20) {
    df[,1:min((NUM_PREAMBLE + 3*how_many), ncol(df))]
}

# Predicates
quick_pred_is_S4_dispatch <- function(df) {
    df %>% get_S4_rows %>% nrow > 0
}

get_S4_rows <- function(df, only_user_def=T) {
    # Get all type rows.
    type_row_names <- names(df)[grepl("_t", fixed=T, names(df))]
    
    # Are there any instances of S4 in a type?
    if (only_user_def) {
        # If we only want these, make sure to remove "methods" and "base".
        df %>% filter_at(type_row_names, any_vars("S4" == .)) %>% filter(! (package == "methods" | package == "base"))
    } else {
        df %>% filter_at(type_row_names, any_vars("S4" == .))
    }
}

process_S3_use_file_to_list_of_files <- function(path) {
    f <- file(path)
    l <- readLines(f)
    close(f)

    l <- map(l, function(e) {
        s <- strsplit(e, " : ")[[1]]

        if(length(s) != 2) {
            # Error in output file
            s[1] <- ""
            s[2] <- "FALSE"

            # Output
            s
        } else {
            s_1_l <- strsplit(s[1], "/")[[1]]
            s[1] <- s_1_l[length(s_1_l)]

            # Output
            s
        }
    })
    
    l <- l[map(l, function(e) as.logical(e[2])) %>% unlist %>% unname]
    
    # Return names only
    map(l, function(e) e[1]) %>% unlist
}

process_S4_use_file_to_list_of_files <- function(path) {
    # Right now, this is the same as S3, so just do that.
    process_S3_use_file_to_list_of_files(path)
}

read_csv_with_header <- function(file_name, path_to_file, path_to_header) {
    df <- read_csv(paste(path_to_file, file_name, sep="/"), col_names=read_header_from_path(paste(path_to_header, file_name, sep="/")))
}

#
#
#
######################################################

###
#
#   Cleaning functions
#

clean_NA_cols <- function(df) {
    map(df, function(col) { col %>% map(is.na) %>% unlist %>% sum }) -> na_counts

    df[na_counts != nrow(df)]
}

get_len_of_fst_line <- function(path) {
    f <- file(path)
    l <- readLines(f, n=1)
    close(f)

    if (length(l) == 0)
        return(0)

    strsplit(l, split=",")[[1]] %>% length
}

###
#
# Generate smaller files.
#
#

trim_csv_to_x_args <- function(s_path, t_path, pname, how_many = 20) {
    df <- read_csv(paste(s_path, "/", pname, ".csv", sep=""), col_names=F)

    write_csv(df %>% quick_trim_df_to_x_args, paste(t_path, "/", pname, ".csv", sep=""), col_names=F)
}

# Maybe useful?
#
#

swap_last_col_with_xth_col <- function(df, x=5) {
    df[, x:ncol(df)] <- df[, c(ncol(df), x:(ncol(df)-1))] 
    
    # return 
    df
}

write_csv_for_reading <- function(df, path) {
    want <- c(c("package", "fun_name", "fun_id", "count"), names(df)[grepl("arg", fixed=T, names(df))])

    df %>% select(want) %>% write_csv(path)
}

#
# For breaking down the data.
#
#
breakdown_dispatch <- function(df) {    
    df %>% select(package, dispatch, count) %>% group_by(dispatch) %>% summarize(count = sum(count)) %>% mutate(percentage = count / sum(df %>% select(count)))
}

breakdown_dispatch_by_pkg <- function(df) {
    df_dispatch <- df %>% select(package, dispatch, count) %>% group_by(package, dispatch) %>% summarize(count=sum(count))

    num_tt <- df_dispatch %>% filter(dispatch == "None") %>% nrow

    num_S3 <- df_dispatch %>% filter(dispatch == "S3") %>% nrow

    num_S4 <- df_dispatch %>% filter(dispatch == "S4") %>% nrow

    # Return
    data.frame( Dispatch = c("Total", "S3", "S4"), 
                NumberOfPackages = c(num_tt, num_S3, num_S4), 
                Percentage = 100 * c(1, num_S3/num_tt, num_S4/num_tt)) %>% as_tibble
}

breakdown_S3_dispatch_by_class <- function(df) {
    df %>% filter(dispatch == "S3") %>% select(count, arg_c0) %>% group_by(arg_c0) %>% summarize(count=sum(count)) %>% arrange(-count)
}

# NOTE TO SELF: mutate shouldnt remove the columns. Do that.
get_multi_classes <- function(df) {
    class_cols <- names(df)[grepl("_c", names(df), fixed=T)]
    class_counts_cols <- paste(class_cols, "_c", sep="")

    # This will convert the classes to counts. We could also add entirely new columns for this, consider that option.
    # df_class_counts <- df %>% mutate_at(vars(class_cols), function(e) unlist(map(e, function(e) if (is.na(e)) 0 else length(strsplit(substr(e, 2, nchar(e)-1), "-")[[1]]))))
    df_class_counts <- df %>% mutate_at(vars(class_cols), .funs = list(c = ~ unlist(map(., function(e) if (is.na(e)) 0 else length(strsplit(substr(e, 2, nchar(e)-1), "-")[[1]])))))

    # Now, isolate those cases where an argument to a function has multiple classes, and we can manually look at those.
    # Removing base because there's just so much base.
    # class_cols[2:length(class_cols)] is class_cols sans the return class
    df_class_counts %>% filter_at(class_counts_cols[2:length(class_counts_cols)], any_vars(. > 1)) %>% filter(package != "base")
}

get_type_class_match <- function(df) {
    # Transform df into a data frame with type, class, and frequency columns.
    # Before that, get the total number of calls to make a percentage.
    tot_calls <- df %>% select(count) %>% sum 

    # 1. Grab all the type, class, and count columns.
    df %>% select(starts_with("arg_t"), starts_with("arg_c"), count) %>% 
        # 2. Stack the data into three columns: type, class, and frequencies
        pivot_longer(-count, names_to = c(".value", "pos"), values_drop_na=T, names_pattern = "arg_(.)(.)") %>%
        # 3. Rename the columns, and remove the useless column introduced by pivot_longer.
        rename(type = t, class = c, frequency = count) %>% select(type, class, frequency) %>%
        # 4. Group by type and class, collapse frequencies.
        group_by(type, class) %>% summarize(frequency = sum(frequency)) %>%
        # 5. Ungroup.
        ungroup %>% arrange(-frequency) %>%
        # 6. Add percentage of total calls column.
        mutate(percentage = 100 * frequency / tot_calls)
}

get_class_attr_match <- function(df) {
    # Transform df into a data frame with type, class, and frequency columns.
    # Before that, get the total number of calls to make a percentage.
    tot_calls <- df %>% select(count) %>% sum 

    # 1. Grab all the type, class, and count columns.
    df %>% select(starts_with("arg_c"), starts_with("arg_a"), count) %>% 
        # 2. Stack the data into three columns: type, class, and frequencies
        pivot_longer(-count, names_to = c(".value", "pos"), values_drop_na=T, names_pattern = "arg_(.)(.)") %>%
        # 3. Rename the columns, and remove the useless column introduced by pivot_longer.
        rename(class = c, attributes = a, frequency = count) %>% select(class, attributes, frequency) %>%
        # 4. Group by type and class, collapse frequencies.
        group_by(class, attributes) %>% summarize(frequency = sum(frequency)) %>%
        # 5. Ungroup.
        ungroup %>% arrange(-frequency) %>%
        # 6. Add percentage of total calls column.
        mutate(percentage = 100 * frequency / tot_calls)
}

  # #
#
#  Ok, this is a big one. 
#  We need to define the rules that will reduce us to a type from the "type", class, and attribute columns
#
transform_into_our_types <- function(df) {

}

# map(lof, function(f) read_csv(f, col_names=F) %>% swap_last_col_with_xth_col %>% write_csv(TODO fill, col_names=F)

# df_apply_c %>% select(-trace_hash) %>% group_by_at(setdiff(names(df_apply_c), c("count", "trace_hash"))) %>% summarize(count=sum(count)) %>% ungroup %>% select(package, fun_name, fun_id, count, everything()) %>% select(-fun_id) %>% write_csv("just_apply.csv")

# this is to get the headers to get written:
#  
# path <- "~/ecoop_experiment_reduced_header"
# headers %>% names %>% map(function(n) {
#     
#     f <- file(paste(path, n, sep="/"))
#     writeLines(headers[[n]], f)
#     close(f)
# })