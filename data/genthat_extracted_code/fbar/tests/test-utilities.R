context("utilities")

suppressMessages(library('testthat'))
suppressMessages(library('dplyr'))
suppressMessages(library('magrittr'))
suppressMessages(library('purrr'))
suppressMessages(library('stringr'))
suppressMessages(library('tibble'))
suppressMessages(library('tidyr'))
suppressMessages(library('ROI.plugin.ecos'))
suppressMessages(library('fbar'))


addresses <- c(
  'http://bigg.ucsd.edu/static/models/iJO1366.json',
  'http://bigg.ucsd.edu/static/models/iAF1260.json',
  'http://bigg.ucsd.edu/api/v2/models/iND750/download',
  'http://bigg.ucsd.edu/static/models/e_coli_core.json',
  'http://bigg.ucsd.edu/static/models/RECON1.json'
)

for (address in addresses) {
  test_that(paste("Works correctly with", address), {
    skip_if_not_installed('jsonlite')
    skip_if_not_installed('curl')

    expanded <- get_BiGG(address)
    
    expanded %>% validate_expanded()
    expanded %>% expanded_to_ROI()
    
    reaction_table <- expanded_to_reactiontbl(expanded)
    reaction_table <- find_fluxes_df(reaction_table)
    expect_true(all(c('abbreviation', 'lowbnd', 'uppbnd', 'obj_coef', 'equation', 'officialName', 'flux' ) %in% colnames(reaction_table)))
    
  })
}
