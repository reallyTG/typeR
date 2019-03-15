
# This is the new file, leveraging the modified version of genthat which does
# a good amount of preprocessing.

# scratch.R contains the functions for the old pipeline, if you're interested
# in using the full traces instead of the modified tracer.

# -a

# TODO list
#
# [X] use attribute patterns, not just attributes
# [X] write getters (get sigs with a type, attr, class)
# [ ] consider putting attr names as their own column still
# [X] make sure that you can pull out signatures that you're interested in,
#     try it with a few examples (class, and coinciding)
# [ ] full monomorphic
# [ ] how many are just scalar
# [ ] see numbers (1) without vector/scalar distinction, and
# [ ] (2) without NULL / X distinction
# [ ] different type systems
# [ ] breakdown by package
# [ ] make all non-attribute classes primitive

# Require tidyverse for convenience.
require(tidyverse)

# one of our polymorphic type maps
type_map <- list(
  character   = c("character/vector", "character/scalar"),
  integer     = c("integer/vector", "integer/scalar"),
  double      = c("double/vector", "double/scalar"),
  complex     = c("complex/vector", "complex/scalar"),
  raw         = c("raw/vector", "raw/scalar"),
  logical     = c("logical/vector", "logical/scalar"),
  list        = c("list<*>"),
  vector      = c("character/vector", "integer/vector", "double/vector",
                  "complex/vector", "raw/vector", "logical/vector"),
  index       = c("character", "double", "integer")
  # TODO: wildcard for list? or just wildcard for any type, *
)

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

reduce_extracted_lofuns_to_one <- function(lofuns_c_e) {
  r <- Reduce(rbind, lofuns_c_e)           # bind everything together
  collapse_me <- lapply(r[, 1], function(x) sort(unlist(x)))
  rep <- sapply(collapse_me, function(x) {paste(x, collapse="~")})
  which <- names(r)[1]
  if (which == "type") {
    r$type <- rep
  } else if (which == "attr") {
    r$attr <- rep
  } else if (which == "class") {
    r$class <- rep
  }
  group_by(r, .dots=list(which)) %>% # this is a dumb ass hack
  do(count=sum(.$count)) %>%
  as.data.frame
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

# TODO
# TODO : Think about how this should work. Right now, not working exactly as intended.
# TODO   If giving a pair, want the whole pair to be in. e.g. when looking for a data.frame


# [PREDICATE]
# df should be a full_sig df
# TODO: make strict version also?
does_df_have_X_attrs <- function(df, attrs_to_find) {
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
            s %in% attrs_to_find
          }))
        } else {
          FALSE
        }
      }))
    }))
  } else
    FALSE
}

does_df_have_X_types <- function(df, types_to_find) {
  if (!is.na(df$arg_name[1])) {
    Reduce("||", lapply(df$type, function(lotypes) {
      types_to_find %in% lotypes
    }))
  } else
    FALSE
}

does_df_have_X_classes <- function(df, classes_to_find) {
  if (!is.na(df$arg_name[1])) {
    Reduce("||", lapply(df$class, function(loclasses) {
      classes_to_find %in% loclasses
    }))
  } else
    FALSE
}

# usage: does_df_have_coinciding_types(df, list("index", "list")) and
#        ...(df, list("index", "vector"))
# TODO: check also for names attribute?
does_df_have_coinciding_types <- function(df, list_of_types) {
  list_to_check <- process_list_for_types(list_of_types)

}

# less general, for index and list, to get an idea
# strict
does_df_have_coinciding_types_index_and_list <- function(df) {
  check1 <- list("integer", "character")
  check2 <- list("double", "character")
  check3 <- list("integer", "double", "character")
  distilled_types <- lapply(df$type, function(lot) unique(lapply(lot, distill_type)))
  index_rows <- lapply(distilled_types, function(lot) {
    (length(lot) == 2 && Reduce("&&", check1 %in% lot) || Reduce("&&", check2 %in% lot)) ||
    (length(lot) == 3 && Reduce("&&", check3 %in% lot))
  })
  type_shapes <- lapply(df$type, function(lot) unique(lapply(lot, distill_type_for_shape)))
  list_rows <- lapply(type_shapes, function(lot) {
    "list" %in% lot || "vector" %in% lot
    # if there is any hope of this argument being listy
  })
  # now, probably xor the list_rows and index_rows to make sure there is a configuration
  # where the indexy is different from the listy
  Reduce("||", xor(unlist(index_rows), unlist(list_rows)))
}

# map supertypes to "atomic" types
process_list_for_types <- function(lot) {
  translate <- function(x) {
    if (x %in% names(type_map))
      type_map[[x]]
    else
      x
  }
  got <- lapply(lot, translate)
  got <- lapply(got, translate) # max depth needed is 2, just check it
}

distill_type <- function(t) {
  if (grepl("list", t))
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

distill_type_for_shape <- function(t) {
  if (grepl("list", t))
    "list"
  else if (grepl("vector", t))
    "vector"
  else
    t
}

# # # # # # # # # # # # #
#           END         #
# <Extractor Functions> #
#           ,,,         #
# # # # # # # # # # # # # # # # # #


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
# Aux functions. For use with processing scripts, mostly, to ensure that things
# are properly loaded and located.
#

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

#
#
#
#
#
#
#
# # # # # #
