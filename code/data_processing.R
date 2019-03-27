
# This is the new file, leveraging the modified version of genthat which does
# a good amount of preprocessing.

# scratch.R contains the functions for the old pipeline, if you're interested
# in using the full traces instead of the modified tracer.

# -a

# TODO list
#
# [X] use attribute patterns, not just attributes
# [X] write getters (get sigs with a type, attr, class)
# [-] consider putting attr names as their own column still
# [X] make sure that you can pull out signatures that you're interested in,
#     try it with a few examples (class, and coinciding)
# [X] print function for notebook
# [X] full monomorphic
# [X] how many are just scalar A: 40%
# [X] see numbers (1) without vector/scalar distinction, and
# [X] (2) without NULL / X distinction
# [X]     also w/o NA / X distinction
# [X] different type systems
# [X] breakdown by package
# [X] get top poly packages
# [ ] make more metrics for polymorphism
# [X] make all non-attribute classes primitive
# [-] CLEAN UP THE DATA FRAMES -- right now, the type list has useless sublists
# [X] how many lines of code were analyzed?
# [X] how old is the oldest version of a package we analyzed? > 20 years
# [X] how many R programmers were involved? > 10k programmers
# [ ] deal with errors
# [X] develop notion of size of polymorphism
# [ ] develop more/better notions of size of polymorphism
# [X] get numbers for coninciding ... list or vector X character or numeric
# [ ] " " ... argument and return type signatures
# [X] fold new data in with old data --- newer runs generate more info for a number
#     of already seen packages. It would be best if we could combine that information.
#     Probably easy enough, just take the traces, process them, and bind them.
# [ ] do we want anything more out of the data? names? dims? could be fun to get
# [ ] skip retv in coincidence checking?
# [ ] better author name metric (just last name?)

# Issues:
# [ ] list<any> happens even for ints, doubles... we end up with list<any>, list<real>
#     polymorphism. what should we do about this?

# Notes:
# re: char/real poly: retvs with char/X could be communicating error messages

# Rerun:
# [X] count all things that happened
# [X] execution time (per script in genthat) (genthat_runtimes)
# [X] number of recorded events
# [X] deal with overlap in saving -- seems to not be a problem, actually
# [X] move extraced code to reasonable location (genthat_extracted_code)
# [X] set up for ``trace everything just once'':
#     package_info(pname) gives all dependencies, maybe want to trace those
# [X] how to deal with base??? -- don't
#
#
# [ ] map args to retvs

# Paper
# [X] Corpus table -- signatures observed and recorded in top 10

# Current RUNID:
# [       ]

# Require tidyverse for convenience.
require(tidyverse)

# TYPE
#      MAPS
#
# A type map should map existing R types to some conceivable type system, or
# the other way around depending.

# T0: fine-grained type system, which aims to empower the user as much as possible.
type_map_r_to_T0 <- list(
  character   = c("vector/character", "scalar/character"),
  integer     = c("vector/integer", "scalar/integer"),
  double      = c("vector/double", "scalar/double"),
  complex     = c("vector/complex", "scalar/complex"),
  raw         = c("vector/raw", "scalar/raw"),
  logical     = c("vector/logical", "scalar/logical"),
  list        = c("list<any>"), # in theory this could be anything
  vector      = c("vector/character", "vector/integer", "vector/double",
                  "vector/complex", "vector/raw", "vector/logical"),
  index       = c("character", "double", "integer")
)

type_map_T0_to_r <- list(
  `vector/character`  = "character",
  `scalar/character`  = "character",
  `vector/integer`    = "integer",
  `scalar/integer`    = "integer",
  `vector/double`     = "double",
  `scalar/double`     = "double",
  `vector/raw`        = "raw",
  `scalar/raw`        = "raw",
  `vector/logical`    = "logical",
  `scalar/logical`    = "logical",
  `vector/complex`    = "complex",
  `scalar/complex`    = "complex",
  `list<>`            = "list",      # note: make sure to convert list<X> -> list<>
  raw_NA              = "logical",
  `data.frame`        = "list"
)

type_map_r_to_real <- list(
  integer   = "real",
  double    = "real"
)

type_map_sv_to_real <- list(
  `vector/integer`    = "vector/real",
  `scalar/integer`    = "scalar/real",
  `vector/double`     = "vector/real",
  `scalar/double`     = "scalar/real",
   double             = "real",
   integer            = "real"
)

primitive_classes <- list(
  "character",
  "complex",
  "double",
  "expression",
  "integer",
  "list",
  "logical",
  "numeric",
  "single",
  "raw",
  "matrix",
  "data.frame",
  "NULL",
  "factor",
  "function"
)

character_pack   = c("vector/character",  "scalar/character")
integer_pack     = c("vector/integer",    "scalar/integer")
double_pack      = c("vector/double",     "scalar/double")
complex_pack     = c("vector/complex",    "scalar/complex")
raw_pack         = c("vector/raw",        "scalar/raw")
logical_pack     = c("vector/logical",    "scalar/logical")
real_pack        = c("vector/real",       "scalar/real")

# # # # # #
#
# Globals and Set up
#
setup_typeR <- function() {
  # this is to prevent lists of strings being bloated with irrelevant metadata
  options(stringsAsFactors=FALSE)
}

#
#
# # # # # #

# # # # # #
#
# this is your entry point to this framework.
# path_to_fun should point to a directory containing the output of running:
#
# < gen_from_package(some_package, output_dir=path_to_fun, action="export") >
#
# this particular function is for one package, use _lolodf for a batch run
#
read_and_make_lofun <- function(pname, path_to_exports="trace_exports") {
  # list all functions
  the_path <- paste(path_to_exports, pname, sep="/")
  funs <- list.files(the_path)

  # built up sub paths (to function traces)
  sub_paths <- unname(sapply(funs, function(x) {
    paste(the_path, x, sep="/")
  }))

  names(sub_paths) <- funs

  # get the actual traces themselves
  # and take the sublists and turn them into a DF
  lapply(sub_paths, function(x) {
    lapply(list.files(x, full.names=TRUE), function(y) {
      lapply(y, function(z) {
        trace_to_convert <- NULL
        tryCatch({trace_to_convert <- readRDS(z)}, error = function(e) {})
        convert_trace_to_df(trace_to_convert)
      })
    })
  }) -> fix_me

  # i hate that i have to do this
  if (length(fix_me) > 0) {
    for (i in 1:length(fix_me)) {
      if (length(fix_me[[i]] > 0)) {
        for (j in 1:length(fix_me[[i]]))
          fix_me[[i]][[j]] <- fix_me[[i]][[j]][[1]] # idiotic list insertion
      }
    }
  }

  fix_me
}

read_and_make_lopkgs <- function(path_to_exports="trace_exports") {
  # list files, read, make lodf, make lolodf
  # list files
  pkg_names <- list.files(path_to_exports)
  names(pkg_names) <- pkg_names

  lapply(pkg_names, function(pkg_name) {
    read_and_make_lofun(pkg_name, path_to_exports=path_to_exports)
  })
}

transform_to_attr_pattern <- function(df) {
  df$attr <- lapply(df$attr, function(attr_l) {
    paste0("{", paste(attr_l[!is.na(attr_l)], collapse=","), "}")
  })

  df
}

# take the output of read_and_make_lopkgs and collapse each sublist by argument
# this will give you complete signatures (type, attr, and class)
collapse_per_arg_lopkg <- function(lopkgs) {
  lapply(lopkgs, collapse_per_arg_lofun)
}

# use on just one package output
# gives you a lofun_c
collapse_per_arg_lofun <- function(lofuns) {
  lofuns <- sanitize_lofuns(lofuns)

  # first, collapse to attribute patterns
  lapply(lofuns, function(funs) {           # TODO something fishi
    lapply(funs, transform_to_attr_pattern)
  }) %>%
  # now, combine
  lapply(function(fun_runs) {
    Reduce(rbind, fun_runs)   %>%
    group_by(arg_name)        %>%
    do(type=union(.$type, c()), attr=union(.$attr, c()), class=union(.$class, c())) %>%
    as.data.frame
  })
}

sanitize_lofuns <- function(lofuns) {
  intermed <- lapply(lofuns, sanitize_lodfs)
  intermed[sapply(intermed, is.null)] <- NULL
  intermed
}

sanitize_lodfs <- function(lodfs) {
  remove <- sapply(lodfs, function(x) {
    if (nrow(x) == 0)
      TRUE
    else
      FALSE
  })

  lodfs[remove] <- NULL
  if (length(lodfs) == 0)
    NULL
  else
    lodfs
}

#
#
#
#
# # # # # #

# # # # # # # # # # # # #
#         START         #
# <Counting Functions>  #
#          ,,,          #
# # # # # # # # # # # # #

apply_count_to_lopkg_c <- function(lopkg_c, count_fun) {
  Reduce("+", lapply(lopkg_c, count_fun))
}

args_count_all <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, nrow))
}

args_count_all_mono_all <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want_type <- lapply(fun_df$type, length) == 1
    want_attr <- lapply(fun_df$attr, length) == 1
    want_class <- lapply(fun_df$class, length) == 1
    want <- sapply(1:length(want_type), function(i) {
      want_type[[i]] && want_class[[i]] && want_attr[[i]]
    })
    length(want[want])
  }))
}

args_count_all_mono_type <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want <- lapply(fun_df$type, length) == 1
    length(want[want])
  }))
}

args_count_all_mono_class <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want <- lapply(fun_df$class, length) == 1
    length(want[want])
  }))
}

# only reason this works easily is because we store attribute patterns in
# the full signatures
args_count_all_mono_attr_pattern <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want <- lapply(fun_df$attr, length) == 1
    length(want[want])
  }))
}

#      #       #      #
#      Functions      #
#      #       #      #

fun_count_all_mono_type <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want <- lapply(fun_df$type, length) == 1
    if (length(want[want]) == nrow(fun_df))
      1
    else
      0
  }))
}

fun_count_all_mono_attr_pattern <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want <- lapply(fun_df$attr, length) == 1
    if (length(want[want]) == nrow(fun_df))
      1
    else
      0
  }))
}

fun_count_all_mono_class <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want <- lapply(fun_df$class, length) == 1
    if (length(want[want]) == nrow(fun_df))
      1
    else
      0
  }))
}

fun_count_all_mono_all <- function(lofun_c) {
  Reduce("+", lapply(lofun_c, function(fun_df) {
    want_type <- lapply(fun_df$type, length) == 1
    want_attr <- lapply(fun_df$attr, length) == 1
    want_class <- lapply(fun_df$class, length) == 1
    want <- sapply(1:length(want_type), function(i) {
      want_type[[i]] && want_class[[i]] && want_attr[[i]]
    })
    if (length(want[want]) == nrow(fun_df))
      1
    else
      0
  }))
}

# # # # # # # # # # # # #
#          END          #
# <Counting Functions>  #
#          ...          #
# # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # # #
#          START          #
# <Poly Tally Functions>  #
#           ,,,           #
# # # # # # # # # # # # # #

reduce_extracted_lopkgs_to_one <- function(lopkgs_c_e) {
  r <- Reduce(rbind, lapply(lopkgs_c_e, reduce_extracted_lofuns_to_one))
  r$count <- unlist(r$count) # why
  which <- names(r)[1]
  if (is.null(which)) {
    # skip
    which
  } else {
    group_by(r, .dots=list(which)) %>% # this is a dumb ass hack
    do(count=sum(.$count)) %>%
    as.data.frame -> r
    r$count <- unlist(r$count)
    rep <- lapply(r[, 1], function(x) {strsplit(x, split="~")})
    if (which == "type") {
      r$type <- rep
    } else if (which == "attr") {
      r$attr <- rep
    } else if (which == "class") {
      r$class <- rep
    }
    r
  }
}

reduce_extracted_lofuns_to_one <- function(lofuns_c_e) {
  r <- Reduce(rbind, lofuns_c_e)           # bind everything together
  collapse_me <- lapply(r[, 1], function(x) sort(unlist(x)))
  rep <- sapply(collapse_me, function(x) {paste(x, collapse="~")})
  which <- names(r)[1]
  if (is.null(which)) {
    # nothing to do
  } else if (which == "type") {
    r$type <- rep
  } else if (which == "attr") {
    r$attr <- rep
  } else if (which == "class") {
    r$class <- rep
  }
  if (is.null(which)) {
    NULL
  } else {
    group_by(r, .dots=list(which)) %>% # this is a dumb ass hack
    do(count=sum(.$count)) %>%
    as.data.frame
  }
}

apply_extract_to_lopkg <- function(lopkg_c, extract_fun) {
  r <- lapply(lopkg_c, function(x) {apply_extract_to_lofun(x, extract_fun)})
  r[sapply(r, length) > 0] # make sure only get the ones that exist
}

apply_extract_to_lofun <- function(lofun_c, extract_fun) {
  r <- lapply(lofun_c, extract_fun)
  r[sapply(r, nrow) > 0] # make sure only get the ones that exist
}

extract_poly_type_args <- function(df_c) {
  df_c$count <- rep(1, nrow(df_c))
  r_df <- df_c[ lapply(df_c$type, length) > 1, c("type", "count")]
  r_df
}

extract_poly_attr_args <- function(df_c) {
  df_c$count <- rep(1, nrow(df_c))
  r_df <- df_c[ lapply(df_c$attr, length) > 1, c("attr", "count")]
  r_df
}

extract_poly_class_args <- function(df_c) {
  df_c$count <- rep(1, nrow(df_c))
  r_df <- df_c[ lapply(df_c$class, length) > 1, c("class", "count")]
  r_df
}

# # # # # # # # # # # # # #
#           END           #
# <Poly Tally Functions>  #
#           ,,,           #
# # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # # #
#          START        #
# <Extractor Functions> #
#           ,,,         #
# # # # # # # # # # # # #

# workflow:
#
# > use [PREDICATE] functions to say if a df matches criteria
# > use [EXTRACTOR] functions to "filter" in the fun pro sense

# [EXTRACTOR] [FROM PACKAGE]
get_fun_sigs_matching_pred_from_lopkg <- function(lopkg, pred, ...) {
  Reduce(c, lapply(lopkg, function(lofun) {
    get_fun_sigs_matching_pred_from_lofun(lofun, pred, ...)
  }))
}

# [EXTRACTOR] [FROM FUN]
get_fun_sigs_matching_pred_from_lofun <- function(lofun, pred, ...) {
  lofun[unname(sapply(lofun, function(x) pred(x, ...)))]
}


# [PREDICATE]
# df should be a full_sig df
does_df_have_X_attrs <- function(df, attrs_to_find, strict=FALSE) {
  if (!is.na(df$arg_name[1])) {
    Reduce("||", lapply(df$attr, function(attr_pttrns) {
      Reduce("||", lapply(attr_pttrns, function(pttrn) {
        # build list of names from list of name:type pairs
        attr_names <- lapply(strsplit(substr(pttrn, 2, nchar(pttrn)-1), split=",")[[1]], function(nt) {
          strsplit(nt, ":")[[1]][[1]]
        })
        # reduce that list (if applicable) with desired name
        if (length(attr_names) > 0) {
          Reduce("||", lapply(attr_names, function(s) {
            Reduce("&&", s %in% attrs_to_find) && (!strict || length(s) == length(attrs_to_find))
          }))
        } else {
          FALSE
        }
      }))
    }))
  } else
    FALSE
}

does_df_have_X_types <- function(df, types_to_find, strict=FALSE) {
  if (!is.na(df$arg_name[1])) {
    Reduce("||", lapply(df$type, function(lotypes) {
      Reduce("&&", types_to_find %in% lotypes) && (!strict || length(lotypes) == length(types_to_find))
    }))
  } else
    FALSE
}

does_df_have_X_classes <- function(df, classes_to_find, strict=FALSE) {
  if (!is.na(df$arg_name[1])) {
    Reduce("||", lapply(df$class, function(loclasses) {
      Reduce("&&", classes_to_find %in% loclasses) && (!strict || length(loclasses) == length(classes_to_find))
    }))
  } else
    FALSE
}

# to check for dates
# TODO stupid ass extra lists... shouldnt need to unlist(r["type"])
does_df_have_date_real_char <- function(df) {
  # look at types and classes
  date_classes <- list("Date", "POSIXct", "POSIXt")
  check_date_type <- list("real", "character")
  good_rows <- apply(df[, c("type", "class")], 1, function(r) {
    length(unlist(r["type"])) == 2 && Reduce("&&", check_date_type %in% unlist(r["type"])) &&
    Reduce("||", date_classes %in% unlist(r["class"]))
  })
  # want there to be one such row
  Reduce("||", good_rows)
}

# usage: does_df_have_coinciding_types(df, list("index", "list")) and
#        ...(df, list("index", "vector"))
# TODO: check also for names attribute?
does_df_have_coinciding_types <- function(df, list_of_types) {
  list_to_check <- process_list_for_types(list_of_types)

}

does_df_have_coinciding_types_index_and_list_reduced_TS <- function(df) {
  check_index <- list("real", "character")
  # distilled_types <- lapply(df$type, function(lot) unique(lapply(lot, distill_type)))
  index_rows <- lapply(df$type, function(lot) {
    length(lot) == 2 && Reduce("&&", check_index %in% lot)
  })
  # at least one of those needs to be true
  if (!Reduce("||", index_rows))
    return(FALSE)

  list_rows <- lapply(df$type, function(lot) {
    # TODO do this for vectors also? might need to modify pipeline
    "list" %in% lot # if there is any hope of this argument being listy
  })
  # again, at least one needs to be true
  if (!Reduce("||", list_rows))
    return(FALSE)

  # now, probably xor the list_rows and index_rows to make sure there is a configuration
  # where the indexy is different from the listy
  Reduce("||", xor(unlist(index_rows), unlist(list_rows)))
}

# ensure that df
does_df_have_coinciding_types_index_and_list_or_vector <- function(df) {
  # Note: skip retv?
  df <- df[df$arg_name != "retv", ]

  check_index <- list("real", "character")
  distilled_types <- lapply(df$type, function(lot) unique(lapply(lot, distill_type)))
  distilled_types <- translate_type_list_with_type_map(distilled_types, type_map_r_to_real)
  index_rows <- lapply(distilled_types, function(lot) {
    length(lot) == 2 && Reduce("&&", check_index %in% lot)
  })
  # at least one of those needs to be true
  if (!Reduce("||", index_rows))
    return(FALSE)

  types_as_shapes <- lapply(df$type, function(lot) unique(lapply(lot, distill_type_to_shape)))
  listy_rows <- lapply(types_as_shapes, function(lot) {
    "list" %in% lot || "vector" %in% lot # if there is any hope of this argument being listy
  })
  # again, at least one needs to be true
  if (!Reduce("||", listy_rows))
    return(FALSE)

  # now, probably xor the list_rows and index_rows to make sure there is a configuration
  # where the indexy is different from the listy
  Reduce("||", xor(unlist(index_rows), unlist(listy_rows)))
}

# Just index but no list
# TODO this isn't exactly the opposite of does_df_have_coinciding_types_index_and_list_or_vector.
#
does_df_have_coinciding_types_index_and_NOT_list_or_vector <- function(df) {
  df <- df[df$arg_name != "retv", ]

  check_index <- list("real", "character")
  distilled_types <- lapply(df$type, function(lot) unique(lapply(lot, distill_type)))
  distilled_types <- translate_type_list_with_type_map(distilled_types, type_map_r_to_real)
  index_rows <- lapply(distilled_types, function(lot) {
    length(lot) == 2 && Reduce("&&", check_index %in% lot)
  })
  # at least one of those needs to be true
  if (!Reduce("||", index_rows))
    return(FALSE)

  types_as_shapes <- lapply(df$type, function(lot) unique(lapply(lot, distill_type_to_shape)))
  list_rows <- lapply(types_as_shapes, function(lot) {
    "list" %in% lot || "vector" %in% lot # if there is any hope of this argument being listy
  })

  # want all rows WHICH ARE NOT INDEX ROWS to be list-free.
  # by this point at least one row has an index
  Reduce("||", (!unlist(list_rows)) || unlist(index_rows))
}

# # # # # # # # # # # # #
#           END         #
# <Extractor Functions> #
#           ,,,         #
# # # # # # # # # # # # # # # # # #


# # # # # # # # # # # # # # # # # #
#          START            #
# <ROW Extractor Functions> #
#           ,,,             #
# # # # # # # # # # # # # # #
#
# These functions are to get specific rows matching some criteria.
#

# These functions handle getting rid of empty sublists and data frames.
apply_row_extractor_to_lopkg_c <- function(lopkg_c, r_e_fun) {
  r <- lapply(lopkg_c, function(lofun_c) {
    apply_row_extractor_to_lofun_c(lofun_c, r_e_fun)
  })
  r[sapply(r, length) > 0]
}

# also removes empties
apply_row_extractor_to_lofun_c <- function(lofun_c, r_e_fun) {
  r <- lapply(lofun_c, r_e_fun)
  r[sapply(r, nrow) > 0]
}

get_rows_from_df_only_scalar <- function(df) {
  # first, change types to shapes
  shapes <- lapply(df$type, function(lot) {
    unique(lapply(unlist(lot), distill_type_to_shape))
  })
  which_are_just_scalar <- sapply(shapes, function(los) {
    length(los) == 1 && los[[1]] == "scalar"
  })

  df[which_are_just_scalar, ]
}

# # # # # # # # # # # # # # #
#           END             #
# <ROW Extractor Functions> #
#           ,,,             #
# # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # # #
#          START            #
# <TyS Transform Functions> #
#           ,,,             #
# # # # # # # # # # # # # # #
#
# These functions are for going from one type system to another.
#

#
# Use this after int, dbl -> real conversion
distinguish_matrices_df <- function(df) {
  # in trans_me, we want to turn the vector/real into a real
  trans_me <- apply(df, 1, function(x)
    "matrix" %in% x[["class"]] &&
    ((! "numeric" %in% x[["class"]] && "vector/double" %in% x[["type"]]) ||
     (! "integer" %in% x[["class"]] && "vector/integer" %in% x[["type"]])))

  types <- df$type
  typess <- lapply(types[trans_me], function(x) {
    x[x=="vector/integer"] <- "matrix"
    x[x=="vector/double"] <- "matrix"
    unique(x)
  })
  types[trans_me] <- typess
  df$type <- types

  add_me <- apply(df, 1, function(x)
    "matrix" %in% x[["class"]] &&
    (("numeric" %in% x[["class"]] && "vector/double" %in% x[["type"]]) ||
     ("integer" %in% x[["class"]] && "vector/integer" %in% x[["type"]])))

  types <- df$type
  typess <- lapply(types[add_me], function(x) {c(x, "matrix")})
  types[add_me] <- typess
  df$type <- types

  df
}

# this one needs to be after real conversion
# distinguish_matrices_df <- function(df) {
#   # in trans_me, we want to turn the vector/real into a real
#   trans_me <- apply(df, 1, function(x)
#     "matrix" %in% x[["class"]] && ! "numeric" %in% x[["class"]] && "vector/real" %in% x[["type"]])
#
#   types <- df$type
#   typess <- lapply(types[trans_me], function(x) {x[x=="vector/real"] <- "matrix"; x})
#   types[trans_me] <- typess
#   df$type <- types
#
#   add_me <- apply(df, 1, function(x)
#     "matrix" %in% x[["class"]] &&
#     ("numeric" %in% x[["class"]] || "integer" %in% x[["class"]]) &&
#     "vector/real" %in% x[["type"]])
#
#   types <- df$type
#   typess <- lapply(types[add_me], function(x) {c(x, "matrix")})
#   types[add_me] <- typess
#   df$type <- types
#
#   df
# }

change_type_systems_lopkg <- function(lopkg_c, a_type_map) {
  lapply(lopkg_c, function(lofun_c) change_type_systems_lofun(lofun_c, a_type_map))
}

change_type_systems_lofun <- function(lofun_c, a_type_map) {
  lapply(lofun_c, function(df) change_type_systems_df(df, a_type_map))
}

change_type_systems_df <- function(df, a_type_map) {
  # new_types <- lapply(df$type, unlist)
  # df$type <- translate_type_list_with_type_map(new_types, a_type_map)
  translate_df_with_type_map(df, a_type_map)
}

fold_NULL_into_other_types_df <- function(df) {
  new_types <- lapply(df$type, unlist)
  df$type <- lapply(new_types, function(lot) {
    if (length(lot) > 1) {
      # fold in NULLs if applicable
      where <- lot == "NULL"
      lot[!where]
    } else {
      lot
    }
  })
  df
}

fold_NULL_and_NA_into_other_types_df <- function(df) {
  new_types <- lapply(df$type, unlist)
  df$type <- lapply(new_types, function(lot) {
    if (length(lot) > 1) {
      # fold in NULLs if applicable
      where <- mapply(function(x, y) {x || y}, lot == "NULL", lot == "raw_NA")
      ret <- lot[!where]
      if (length(ret) == 0) {
        # ret <- list("raw_NA_or_NULL") # ok
        ret <- lot[1]
      }
      ret
    } else {
      lot
    }
  })
  df
}

fold_together_int_double_df <- function(df) {
  translate_df_with_type_map(df, type_map_r_to_real)
}

combine_scalar_vector_where_appropriate <- function(df) {
  df$type <- lapply(df$type, function(lot) {
    if (Reduce("&&", character_pack %in% lot))
      lot[lot == "scalar/character"] <- NULL
    else if (Reduce("&&", integer_pack %in% lot))
      lot[lot == "scalar/integer"] <- NULL
    else if (Reduce("&&", double_pack %in% lot))
      lot[lot == "scalar/double"] <- NULL
    else if (Reduce("&&", logical_pack %in% lot))
      lot[lot == "scalar/logical"] <- NULL
    else if (Reduce("&&", raw_pack %in% lot))
      lot[lot == "scalar/raw"] <- NULL
    else if (Reduce("&&", complex_pack %in% lot))
      lot[lot == "scalar/complex"] <- NULL
    else if (Reduce("&&", real_pack %in% lot))
      lot[lot == "scalar/real"] <- NULL
    lot
  })
  df
}

# # # # # # # # # # # # # # #
#           END             #
# <TyS Transform Functions> #
#           ,,,             #
# # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # #
#          START          #
# <Per Package Functions> #
#           ,,,           #
# # # # # # # # # # # # # #
#
# These functions are to tally up per package.
#

# idea: get summary info about a package
tally_up_lofun_c <- function(lofun_c) {
  # 1. get the counts in the package
  this_all <- args_count_all(lofun_c)
  this_mono_all <- args_count_all_mono_all(lofun_c)
  this_mono_type <- args_count_all_mono_type(lofun_c)
  this_mono_class <- args_count_all_mono_class(lofun_c)
  this_mono_attr <- args_count_all_mono_attr_pattern(lofun_c)

  this_all_fun <- length(lofun_c)
  this_mono_all_fun <- fun_count_all_mono_all(lofun_c)
  this_mono_type_fun <- fun_count_all_mono_type(lofun_c)
  this_mono_class_fun <- fun_count_all_mono_class(lofun_c)
  this_mono_attr_fun <- fun_count_all_mono_attr_pattern(lofun_c)

  # list( ... ) here is to get the type list to be a list of lists, instead of a list of strings
  # which need to be split up later
  top_poly_type <- reduce_extracted_lopkgs_to_one(list(apply_extract_to_lofun(lofun_c, extract_poly_type_args)))
  top_poly_attr <- reduce_extracted_lopkgs_to_one(list(apply_extract_to_lofun(lofun_c, extract_poly_attr_args)))
  # top_poly_attr <- attr_name_type_to_name_df(top_poly_attr)
  top_poly_class <- reduce_extracted_lopkgs_to_one(list(apply_extract_to_lofun(lofun_c, extract_poly_class_args)))

  if (!is.null(top_poly_type)) {
    top_poly_type <- top_poly_type[order(-top_poly_type$count),]
  }
  if (!is.null(top_poly_attr)) {
    top_poly_attr <- top_poly_attr[order(-top_poly_attr$count),]
  }
  if (!is.null(top_poly_class)) {
    top_poly_class <- top_poly_class[order(-top_poly_class$count),]
  }

  # compute the total "size" of the polymorphism in the package.
  # depending on what size metric you want, change the function being passed
  size_of_poly <- Reduce("+", lapply(lofun_c, function(df) {
    size_of_signatures_in_df(df, size_of_signature_all)
  }))

  list(
    tot_args             = this_all,
    tot_mono_args_all    = this_mono_all,
    tot_mono_args_type   = this_mono_type,
    tot_mono_args_class  = this_mono_class,
    tot_mono_args_attr   = this_mono_attr,
    tot_funs             = this_all_fun,
    tot_mono_funs_all    = this_mono_all_fun,
    tot_mono_funs_type   = this_mono_type_fun,
    tot_mono_funs_class  = this_mono_class_fun,
    tot_mono_funs_attr   = this_mono_attr_fun,
    tot_size_of_poly     = size_of_poly,
    top_poly_type        = top_poly_type,
    top_poly_attr        = top_poly_attr,
    top_poly_class       = top_poly_class
  )
}

# # # # # # # # # # # # # #
#           END           #
# <Per Package Functions> #
#           ,,,           #
# # # # # # # # # # # # # # # # #

# # # # # #
#
# Transform a data.frame (recorded sig) to (arg, ... arg) -> retv sig.
# Consolidate all of these over a function.
convert_df_to_fun_sig <- function(df) {
  # positions are important, so no sorting.
  # also put in argument names?
  arg_names_types <- mapply( function(x, y) {paste(x, y, sep=": ")},
                             names(df$arg_types), df$arg_types)

  args_only <- sort(arg_names_types[names(arg_names_types) != "retv"])
  retv_only <- arg_names_types["retv"]

  paste("{", paste(args_only, collapse=", "), "}", "->", retv_only)
}

convert_list_of_traces_to_fun_df <- function(lot) {
  convert_me <- lapply(lot, function(x) x$arg_types)
  data.table::rbindlist(unique(convert_me), fill=T)
}

# # # # # #
#
# Functions for doing things sequentially, but by reading files.
#
count_all_in_dir <- function(path_to_lofun_cs, count_fun) {
  lapply(list.files(path_to_lofun_cs, full.names=TRUE), function(lofun_c_p) {
    count_fun(readRDS(lofun_c_p))
  })
}

# # # # # #
#
# Aux functions. For processing scripts, printing, etc.
#

build_arg_count_df_from_lopkgs <- function(lopkgs) {
  total_arguments <- apply_count_to_lopkg_c(lopkgs, args_count_all)
  total_mono_type <- apply_count_to_lopkg_c(lopkgs, args_count_all_mono_type)
  total_mono_attr <- apply_count_to_lopkg_c(lopkgs, args_count_all_mono_attr_pattern)
  total_mono_clas <- apply_count_to_lopkg_c(lopkgs, args_count_all_mono_class)
  total_mono_all <- apply_count_to_lopkg_c(lopkgs, args_count_all_mono_all)

  tot_arg_df <- data.frame(
    Type=c("Full Monomorphic", "Monomorphic in Type", "Monomorphic in Class", "Monomorphic in Attribute Pattern", "Total Seen"),
    Count=round(c(total_mono_all, total_mono_type, total_mono_clas, total_mono_attr, total_arguments) / 1000, 0),
    Percentage=round(c(total_mono_all, total_mono_type, total_mono_clas, total_mono_attr, total_arguments) / total_arguments * 100, 2)
  )

  tot_arg_df
}

build_fun_count_df_from_lopkgs <- function(lopkgs) {
  total_functions <- apply_count_to_lopkg_c(lopkgs, length)
  total_mono_type_functions <- apply_count_to_lopkg_c(lopkgs, fun_count_all_mono_type)
  total_mono_attr_functions <- apply_count_to_lopkg_c(lopkgs, fun_count_all_mono_attr_pattern)
  total_mono_clas_functions <- apply_count_to_lopkg_c(lopkgs, fun_count_all_mono_class)
  total_mono_all_functions <- apply_count_to_lopkg_c(lopkgs, fun_count_all_mono_all)

  tot_fun_df <- data.frame(
    Type=c("Full Monomorphic", "Monomorphic in Type", "Monomorphic in Class", "Monomorphic in Attribute Pattern", "Total Seen"),
    Count=round(c(total_mono_all_functions, total_mono_type_functions, total_mono_clas_functions, total_mono_attr_functions, total_functions) / 1000, 0),
    Percentage=round(c(total_mono_all_functions, total_mono_type_functions, total_mono_clas_functions, total_mono_attr_functions, total_functions) / total_functions * 100, 2)
  )
  tot_fun_df
}

get_counts_for_pkg_in_counts_dir <- function(pkg, path_to_counts) {
  lof <- list.files(path_to_counts, full.names=T)
  tot_obs <- 0
  for (fpath in lof) {
    tryCatch({
      r <- readRDS(fpath)
      maybe_count <- sum(r[[pkg]])
      # if (!is.null(maybe_count))
        tot_obs <- tot_obs + maybe_count
    }, error = function(e) {})
  }
  tot_obs
}

# [X] Tested?
add_count_lists <- function(l1, l2) {
  # top level names i.e. names of sublists
  all_names <- union(names(l1), names(l2))
  names(all_names) <- all_names
  # set up return list
  lapply(all_names, function(tln) {
    sl1 <- l1[[tln]]
    sl2 <- l2[[tln]]
    if(is.null(sl1)) {
      sl2
    } else if (is.null(sl2)) {
      sl1
    } else {
      # complicated case
      # sum up same names
      combo_names <- union(names(sl1), names(sl2))
      names(combo_names) <- combo_names
      sapply(combo_names, function(n) {
        if (is.na(sl1[n])) {
          unname(sl2[n])
        } else if (is.na(sl2[n])) {
          unname(sl1[n])
        } else {
          unname(sl1[n]) + unname(sl2[n])
        }
      })
    }
  })
}

# need: for (n in union(names(r$dapr), names(f$dapr))) { l_combo[n] <- get_w_name_def_0(r$dapr, n) + get_w_name_def_0(f$dapr, n) }
get_w_name_def_0 <- function(v, n) {
  if (is.na(v[n])) 0 else v[n]
}

class_to_primitive_df <- function(df) {
  df$class <- lapply(df$class, function(loc) {
    unique(lapply(unlist(loc), convert_class_to_primitive))
  })
  df
}

convert_class_to_primitive <- function(cl) {
  if (cl %in% primitive_classes)
    "primitive"
  else
    cl
}

# the loaps[[1]] thing is annoying
attr_name_type_to_name_df <- function(df) {
  df$attr <- lapply(df$attr, function(loaps) lapply(loaps[[1]], function(ap) attr_name_type_to_name(ap)))
  df
}

# this is gross. but here we are. takes an attr pattern with name:type pairs,
# and gives you an attr pattern with just names
attr_name_type_to_name <- function(attr_patt) {
  attr_patt <- strsplit(substr(attr_patt, 2, nchar(attr_patt)-1), split=",")
  paste0(c("{", paste0(lapply(attr_patt[[1]], function(ntp) {
    substr(ntp, 1, gregexpr(":", ntp)[[1]][1]-1)
  }), collapse=","), "}"), collapse="")
}

# probably can be handled by generic map fun
process_list_for_types <- function(lot, a_type_map) {
  translate <- function(x) {
    if (x %in% names(a_type_map))
      a_type_map[[x]]
    else
      x
  }
  got <- lapply(lot, translate)
  got <- lapply(got, translate) # max depth needed is 2, just check it
}

translate_df_with_type_map <- function(df, a_type_map) {
  df$type <- translate_type_list_with_type_map(df$type, a_type_map)
  combine_scalar_vector_where_appropriate(df)
}

get_inner_type_of_list_param <- function(lt) {
  substr(lt, 6, nchar(lt)-1)
}

translate_type_list_with_type_map <- function(lolot, a_type_map, unparam=F) {
  translate <- function(x) {
    if (x %in% names(a_type_map))
      a_type_map[[x]]
    else if (substr(x, 1, 5) == "list<")
      paste0("list<", translate(get_inner_type_of_list_param(x)), ">")
    else
      x
  }
  # 1. preprocess parametric types to get their shape
  if (unparam)
    lapply(lolot, function(lot) unique(lapply(lot, function(t) translate(unparametrify(t)))))
  else
    lapply(lolot, function(lot) unique(lapply(lot, function(t) translate(t))))
}

# Function to measure the size of a signature.
# This one just sums up the size of each component of the full signature.
# This could be modified, if we think there is too much double counting.
# Notes: size will always be > 3 with this scheme.
size_of_signature_all <- function(row_in_df) {
  length(unlist(row_in_df$type)) + length(unlist(row_in_df$attr)) +
  length(unlist(row_in_df$class))
}

# Applies the size function to a data frame
size_of_signatures_in_df <- function(df, size_fun) {
  Reduce("+", apply(df[,names(df)], 1, size_fun))
}

unparametrify <- function(t) {
  # in T0, the main parametric type is list<T>
  if (substr(t, 1, 5) == "list<") # that's probably enough
    "list<>"
  else
    t
}

distill_type <- function(t) {
  if (grepl("list", t))
    "list"
  else if (t == "data.frame")
    "list"
  else if (grepl("character", t))
    "character"
  else if (grepl("integer", t))
    "integer"
  else if (grepl("double", t))
    "double"
  else if (grepl("raw", t))
    "raw"
  else if (grepl("logical", t))
    "logical"
  else if (grepl("complex", t))
    "complex"
  else
    t
}

distill_type_to_shape <- function(t) {
  if (grepl("list", t))
    "list"
  else if (t == "data.frame")
    "list"
  else if (grepl("vector", t))
    "vector"
  else if (grepl("scalar", t))
    "scalar"
  else
    t
}

# get a df ready for printing in a Rmd file
format_df_for_print <- function(df) {
  which <- names(df)[1]
  if (which == "type") {
    df$type <- sapply(df$type, function(t) paste0(t[[1]], collapse=", "))
  } else if (which == "attr") {
    df$attr <- sapply(df$attr, function(t) paste0(t[[1]], collapse=", "))
  } else if (which == "class") {
    df$class <- sapply(df$class, function(t) paste0(t[[1]], collapse=", "))
  }
  df
}

# get rid of empty lofuns from a lopkg
remove_empties <- function(lopkg) {
  lopkg[ !sapply(lopkg, function(lofun) length(lofun) == 0)]
}

# Used to reprocess old data and make attribute patterns sorted to avoid
# unwanted differences between patterns. e.g. {a, b} should = {b, a}
sort_old_attr_type_lofun <- function(lofun) {
  lapply(lofun, function(fun) {
    lapply(fun, sort_old_attr_type_df)
  })
}

sort_old_attr_type_df <- function(df) {
  df$attr <- lapply(df$attr, sort)
  df
}

convert_attr_for_df <- function(arg_attr_list) {
  lapply(arg_attr_list, function(attr_list) {
    if (is.null(names(attr_list)))
      NA
    else
      sapply(names(attr_list), function(n) {
        sort(paste(n, attr_list[n], sep=":"))
      })
  })
}

# Helper: convert a trace to a data frame
convert_trace_to_df <- function(t) {

  if (is.null(t)) {
    r_df <- data.frame(arg_name = character())
    r_df$type <- list()
    r_df$attr <- list()
    r_df$class <- list()

    attr(r_df, "failed") <- TRUE
  } else {
    r_df <- data.frame(arg_name = names(t$arg_types))
    r_df$type <- unname(t$arg_types)
    r_df$attr <- convert_attr_for_df(t$arg_attrs)
    r_df$class <- unname(t$arg_classes)

    attr(r_df, "fun") <- t$fun
    attr(r_df, "pkg") <- t$pkg
    attr(r_df, "src") <- t$file_ran
  }

  r_df
}

give_pkg_name_to_attrs_funs <- function(lopkg) {
  named_names <- names(lopkg)
  names(named_names) <- named_names
  lapply(named_names, function(n) {
    lapply(lopkg[[n]], function(fun) {
        attr(fun, "pkg") <- n
        fun
      })
  })
}

# for downloading packages properly
# adapted from http://www.salemmarafi.com/code/install-r-package-automatically/
usePackage <- function(p)
{
  if (!is.element(p, installed.packages()[,1]))
    install.packages(p, dep = TRUE, repos="https://cloud.r-project.org")
  require(p, character.only = TRUE)
}

computeRevDeps <- function(p, recursive=FALSE)
{
  # set the download repo so it doesnt annoy us
  if (getOption("repos") == "@CRAN@") {
    r <- getOption("repos")
    r["CRAN"] <- "https://cloud.r-project.org"
    options(repos = r)
  }

  rdeps <- tools::package_dependencies(
    p,
    which=c("Depends", "Imports", "LinkingTo", "Suggests"),
    reverse=TRUE,
    recursive=recursive)

  rdeps <- unlist(rdeps, use.names=FALSE)
  rdeps
}

# # # # #
#
# Functions for scraping.
# All require rvest.

scrape_for_authors <- function(pname) {
  url <- paste0('https://cran.r-project.org/web/packages/', pname)
  wp <- read_html(url)
  the_t <- html_table(wp)[[1]]
  a_list <- the_t$X2[the_t$X1 == "Author:"]
  a_names <- trimws(strsplit(a_list, split='\n')[[1]])
  unlist(lapply(a_names, function(sn) { strsplit(sn, split=" \\[")[[1]][[1]] }))
}

#
#
#
#
#
#
#
# # # # # #
