## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  eval = TRUE,
  comment = "#>"
)
library(catchr)
library(rlang)

## ---- echo=FALSE---------------------------------------------------------
current_options <- catchr_default_opts(catchr.default_plan,
                                       catchr.warn_about_terms,
                                       catchr.bare_if_possible,
                                       catchr.drop_empty_conds)
restore_catchr_defaults()

arbitrary_code <- function() {}


## ---- eval=FALSE---------------------------------------------------------
#  library(catchr)
#  results <- catch_expr(arbitrary_code(), warning = c(collect, muffle))

## ---- eval=FALSE---------------------------------------------------------
#  collect_warnings <- make_catch_fn(warning = c(collect, muffle))

## ---- eval=FALSE---------------------------------------------------------
#  same_results <- collect_warnings(arbitrary_code())

## ---- eval=FALSE---------------------------------------------------------
#  weirdo_catcher <- make_catch_fn(
#    message = c(function(x) print("oops"), exit),
#    warning = c(tomessage, muffle),
#    error = muffle)

## ---- eval=FALSE---------------------------------------------------------
#  results <- catch_expr(arbitrary_code(), warning = c(collect, muffle))

## ------------------------------------------------------------------------
print(get_default_plan())

my_plans <- make_plans(warning, message, error)

## ------------------------------------------------------------------------
throw_a_fit <- function() {
  message("This is message #1!")
  rlang::warn("This is warning #1!", opt_val = "conditions can hold more data")
  message("This is message #2")
  stop("Code exits after this!")
  warning("This warning won't be reached")
}

collected_results <- catch_expr(throw_a_fit(), message, warning, error)
print(collected_results)

## ---- eval=FALSE---------------------------------------------------------
#  library(future)
#  future::plan(multiprocess)
#  
#  possible_scenarios <- list(
#    quote(warning("Model failed to converge!")),
#    quote(message("Singular fit!")),
#    quote(stop("You couldn't something wrong")),
#    quote("Everything is good!")
#  )
#  
#  collector <- make_catch_fn(message, warning, error,
#                             .opts = catchr_opts(default_plan = c(collect, muffle)))
#  
#  l %<-% {
#    # You should use `purrr::map` instead, it's much better
#    Map(function(x) collector(eval(x)), possible_scenarios)
#  }
#  
#  # Eh, let's get rid of anything that had an error?
#  Filter(function(e) length(e$error) == 0, l)

## ---- eval=FALSE---------------------------------------------------------
#  # Let's combine both `future` and `purrr` with Davis Vaughan's `furrr` package instead
#  library(furrr)
#  future::plan(tweak(multiprocess, workers = 5L))
#  
#  # Sexy data frame format for easy analysis!
#  df <- future_imap_dfr(
#    possible_scenarios,
#    function(x, i) {
#      res <- collector(eval(x))
#      data.frame(k = i,
#                 messages = paste(res$message, collapse=" "),
#                 warnings = paste(res$warning, collapse=" "),
#                 errors =   paste(res$error, collapse=" "),
#                 stringsAsFactors = FALSE)
#    })
#  

## ------------------------------------------------------------------------
messages_or_bust <- make_catch_fn(messages = collect, misc = exit_with("Sorry, busted"))

## ------------------------------------------------------------------------
basic_collector <- make_catch_fn(
  message, warning, error, misc,
  .opts = catchr_opts(default_plan = c(collect, muffle),
                      drop_empty_conds = T))

## ------------------------------------------------------------------------
make_warnings <- function() {
  warning("This warning has a call")
  warning("This warning does not", call. = FALSE)
  invisible("done")
}

catch_expr(make_warnings(), warning = c(display, muffle))

catch_expr(make_warnings(), warning = c(display_with(c("pink","underline","bold")), muffle))

## ---- eval=FALSE---------------------------------------------------------
#  warning_in_middle <- function() {
#    Sys.sleep(2)
#    message("It's time!")
#    Sys.sleep(2)
#    invisible("done")
#  }
#  
#  res <- catch_expr(warning_in_middle(), condition = c(beep, display, muffle))

## ----eval=FALSE----------------------------------------------------------
#  tell_you_when_it_blows_up <- make_catch_fn(condition = c(display, beep_with(9), exit))
#  tell_you_when_it_blows_up(message("Oopsies!"))

## ---- echo=FALSE---------------------------------------------------------
catchr_default_opts(!!!current_options)

