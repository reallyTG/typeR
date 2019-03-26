## ------------------------------------------------------------------------
#' @include functions_sfc.R
skim.sf <- function(.data) {
  rows <- purrr::map(.data, skim_v)
  combined <- dplyr::bind_rows(rows, .id = "var")
  return(structure(combined, class = c("skim_df", class(combined))))
}

