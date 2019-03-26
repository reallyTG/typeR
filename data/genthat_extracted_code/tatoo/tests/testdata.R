
# Base data ---------------------------------------------------------------

t_df1 <- data.frame(
  numbers = c(1.434, 190.3, 228.311, 5.210, 4321543),
  animals = c('dog', 'cat', 'camel', 'pig', 'mouse'),
  factors = factor(c('rain', 'grain', 'stain', 'pain', 'main')),
  ints    = c(10L, 20L, 40L, 30L, 50L),
  stringsAsFactors = FALSE
)

t_df2 <- data.frame(
  numbers_xt = c(1, 290, 0.311, 0.210, 1000),
  animals_xt = c('god', 'tac', 'lemac', 'gip', 'esuom'),
  factors_xt = factor(c('tractor', 'hector', 'andrew', 'milli', 'vanilli')),
  ints    = c(5L, 5L, 10L, 30L, 25L),
  stringsAsFactors = FALSE
)

t_df3 <- data.frame(
  numbers_xt = factor(c(1, 290, 0.311, 0.210, 1000)),
  animals_xt = factor(c('god', 'tac', 'lemac', 'gip', 'esuom')),
  factors_xt = factor(c('tractor', 'hector', 'andrew', 'milli', 'vanilli')),
  ints       = c('god', 'tac', 'lemac', 'gip', 'esuom'),
  stringsAsFactors = FALSE
)



# Table Metadata ----------------------------------------------------------

t_meta_simple <- tt_meta(
  table_id = 'tid',
  title = 'title',
  longtitle = 'longitle',
  subtitle = 'subtitle',
  footer = ' ---------------- '
)

t_meta_verbose <- tt_meta(
  table_id = 'rp1',
  title = 'stack table 1',
  longtitle = c(
    'stack table 1 is a stack of tables',
    'with a very long title',
    'that spans several rows'),
  subtitle = 'with a subtitle',
  footer = c('that has a footer also', 'which goes over man lines')
)

t_meta_sub <- tt_meta(
  subtitle = 'A table that contains numbers but maybe also letters'
)



# Tagged_table ------------------------------------------------------------

t_tagged_1 <- tag_table(t_df1, t_meta_simple)
t_tagged_2 <- tag_table(t_df1, t_meta_verbose)
t_tagged_2 <- tag_table(t_df1, t_meta_sub)



# Mashed Tables -----------------------------------------------------------

t_mash_1 <- mash_table(t_df1, t_df1, t_df1, t_df1)

t_mash_2 <- mash_table(
  t_df1, t_df1, t_df1,
  mash_method = 'col'
)

t_mash_3 <- mash_table(
  t_df1, t_df1, t_df1,
  mash_method = 'col',
  id_vars = 'factors'
)

t_mash_4 <- mash_table(
  table1 = t_df1, table2 = t_df1, table3 = t_df1,
  mash_method = 'col',
  id_vars = 'factors',
  sep_height = 50,
  meta = t_meta_simple
)




# Composite Tables --------------------------------------------------------

tmp <- list()
for(i in seq_len(3)){
  tmp[[i]] <- data.frame(
    id = 1:6,
    small = letters[i:(i+5)],
    tall = LETTERS[i:(i+5)]
  )
}
names(tmp) <- c('tab1', 'tab2', 'tab3')

t_comp_1 <- comp_table_list(tmp)

t_comp_2 <- comp_table_list(
  tmp,
  id_vars = 'id'
)

t_comp_3 <- comp_table_list(
  tmp,
  id_vars = 'id',
  meta = t_meta_simple
)

rm(tmp)



# Stacked Table -----------------------------------------------------------

t_stack_1 <- stack_table(
  t_mash_1, t_mash_2, t_comp_2, t_comp_3,
  meta = t_meta_verbose)

t_stack_2 <- t_stack_1
title(t_stack_2) <- 'Stacked table with spacing 7'
spacing(t_stack_2) <- 7





# Tatoo Report ------------------------------------------------------------

t_report_mash <- compile_report(
  row = t_mash_1,
  col = t_mash_2,
  colby = t_mash_3,
  meta = t_mash_4
)


t_report_comp <- compile_report(
  normal = t_comp_1,
  id_vars = t_comp_2,
  meta = t_comp_3
)


t_report_stack <- compile_report(
  normal = t_stack_1,
  spacing = t_stack_2
)


t_report <- compile_report(
  t_comp_1, t_comp_2, meta = t_mash_4, t_stack_2
)
