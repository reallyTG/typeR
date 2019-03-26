## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE, fig.align = 'center')

## ----load_libraries------------------------------------------------------
# load required libraries
library(cRegulome)
library(RSQLite)
library(ggplot2)

## ----prepare database file, eval=FALSE-----------------------------------
#  # download the db file when using it for the first time
#  destfile = paste(tempdir(), 'cRegulome.db.gz', sep = '/')
#  if(!file.exists(destfile)) {
#      get_db(test = TRUE)
#  }
#  
#  # connect to the db file
#  db_file = paste(tempdir(), 'cRegulome.db', sep = '/')
#  conn <- dbConnect(SQLite(), db_file)

## ----connect_db, include=FALSE-------------------------------------------
# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- dbConnect(SQLite(), fl)

## ----simple_query--------------------------------------------------------
# enter a custom query with different arguments
dat <- get_mir(conn,
               mir = 'hsa-let-7g',
               study = 'STES',
               min_abs_cor = .3,
               max_num = 5)

# make a cmicroRNA object   
ob <- cmicroRNA(dat)

## ----print_object--------------------------------------------------------
# print object
ob

## ----plot_object---------------------------------------------------------
# plot object
cor_plot(ob)

## ----database_file-------------------------------------------------------
# table names
tabs <- dbListTables(conn)
print(tabs)

# fields/columns in the tables
for(i in seq_along(tabs)) {
  print(dbListFields(conn, tabs[i]))
}

## ----database_query------------------------------------------------------
# query the db for two microRNAs
dat_mir <- get_mir(conn,
                   mir = c('hsa-let-7g', 'hsa-let-7i'),
                   study = 'STES')

# query the db for two transcription factors
dat_tf <- get_tf(conn,
                 tf = c('LEF1', 'MYB'),
                 study = 'STES')

# show first 6 line of each of the data.frames
head(dat_mir); head(dat_tf)

## ----cmicroRNA_object----------------------------------------------------
# explore the cmicroRNA object
ob_mir <- cmicroRNA(dat_mir)
class(ob_mir)
str(ob_mir)

## ----cTF_object----------------------------------------------------------
# explore the cTF object
ob_tf <- cTF(dat_tf)
class(ob_tf)
str(ob_tf)

## ----methods_cmicroRNA---------------------------------------------------
# cmicroRNA object methods
methods(class = 'cmicroRNA')

## ----methods_cTF---------------------------------------------------------
# cTF object methods
methods(class = 'cTF')

## ----tidy_method---------------------------------------------------------
# tidy method
head(cor_tidy(ob_mir))

## ----cor_hist_method-----------------------------------------------------
# cor_hist method
cor_hist(ob_mir,
     breaks = 100,
     main = '', xlab = 'Correlation')
dev.off()

## ----cor_joy_method------------------------------------------------------
# cor_joy method
cor_joy(ob_mir) +
    labs(x = 'Correlation', y = '')
dev.off()

## ----cor_venn_diagram_method---------------------------------------------
# cor_venn_diagram method
cor_venn_diagram(ob_mir, cat.default.pos = 'text')
dev.off()

## ----cor_upset_method----------------------------------------------------
# cor_upset method
cor_upset(ob_mir)
dev.off()

## ----citation, eval=FALSE------------------------------------------------
#  citation('cRegulome')

## ----clean, echo=FALSE---------------------------------------------------
dbDisconnect(conn)
unlink('./Venn*')

