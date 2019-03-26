## ----message=FALSE, warning=FALSE----------------------------------------
library(magrittr)
library(tatoo)

## ------------------------------------------------------------------------
df1 <- data.frame(
  Species = c("setosa", "versicolor", "virginica"),
  length = c(5.01, 5.94, 6.59),
  width = c(3.43, 2.77, 2.97)
)

df2 <- data.frame(
  Species = c("setosa", "versicolor", "virginica"),
  length = c(0.35, 0.52, 0.64),
  width = c(0.38, 0.31, 0.32)
)

## ------------------------------------------------------------------------
# Create metadata object
ex_meta <- tt_meta(
  table_id  = 'T01',  
  title     = 'Example Table', 
  longtitle = 'This is an example for tables created with the tatool package', 
  subtitle  = 'It features a lot of titles and very little data', 
  footer    = c('This table was created from the iris dataset', 
                'It consists of 3 different types of irises’',
                 '(Setosa, Versicolour, and Virginica)') 
)

# Create metadata object
tagged_table <- tag_table(
  df1,
  meta = ex_meta
)

print(tagged_table)

## ------------------------------------------------------------------------
meta(df1)  <- ex_meta # df1 gets automatically converted to a Tagged_table

title(df1) <- 'A table with a title'
table_id(df1) <- NULL
longtitle(df1) <- NULL
subtitle(df1) <- NULL
footer(df1) <- NULL

print(df1)

## ------------------------------------------------------------------------
mashed_table <- mash_table(df1, df2)
mashed_table <- mash_table_list(list(df1, df2)) # same as above

title(mashed_table) <- 'A mashed table'
subtitle(mashed_table) <- 
  'Two or more tables mashed together so that rows or columns alternate'

print(mashed_table)

## ------------------------------------------------------------------------
mashed_table_row <- mash_table(
  df1, df2, 
  mash_method = 'row', 
  insert_blank_row = FALSE,
  meta = tt_meta(title = 'A row-mashed table')
)
print(mashed_table_row)

## ------------------------------------------------------------------------
mashed_table_col <- mash_table(
  mean = df1, sd = df2, 
  mash_method = 'col', 
  id_vars = 'Species',
  meta = tt_meta(title = 'A col-mashed table')
)

print(mashed_table_col)

## ------------------------------------------------------------------------
mash_method(mashed_table) <- 'col'
id_vars(mashed_table) <- 'Species'
names(mashed_table) <- c('mean', 'sd')

print(mashed_table)

## ------------------------------------------------------------------------
print(mashed_table, mash_method = 'row', insert_blank_row = TRUE)

## ----message=FALSE-------------------------------------------------------
as_workbook(mashed_table)

## ----eval = FALSE--------------------------------------------------------
#  rmash(df1, df2)
#  rmash(mashed_table)

## ----echo = FALSE--------------------------------------------------------
rmash(df1, df2) 

## ------------------------------------------------------------------------
rmash(df1, df2, insert_blank_row = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  cmash(df1,  df2)
#  cmash(mashed_table)

## ----echo = FALSE--------------------------------------------------------
cmash(df1, df2) 

## ------------------------------------------------------------------------
cmash(mean = df1, sd = df2, id_vars = 'Species')

## ------------------------------------------------------------------------
composite_table <- comp_table(mean = df1, sd = df2)
composite_table <- comp_table_list(list(mean = df1, sd = df2))  # same as above


title(composite_table) <- 'A composite table'
subtitle(composite_table) <- 
  'Two or more tables put side by side, with multi-column-headings'

print(composite_table)


## ------------------------------------------------------------------------
comp_table(mean = df1, sd = df2, id_vars = 'Species')

## ------------------------------------------------------------------------
stacked_table <- stack_table(df1, mashed_table, composite_table)
stacked_table <- stack_table_list(list(df1, mashed_table, composite_table))  # same as above

title(stacked_table) <- 'A stacked table'
subtitle(stacked_table) <- 
  'A list of multiple tables, mainly useful for xlsx export'

print(stacked_table)

## ------------------------------------------------------------------------
tatoo_report <- compile_report(
  tagged = tagged_table, 
  mashed_row = mashed_table_row,
  mashed_col = mashed_table_col, 
  composite = composite_table, 
  stacked = stacked_table
)

print(tatoo_report)



## ------------------------------------------------------------------------
wb <- as_workbook(tatoo_report)  

## ---- eval = FALSE-------------------------------------------------------
#  # save_xlsx(tatoo_report, paste(tempfile(), ".xlsx"), overwrite = TRUE)

