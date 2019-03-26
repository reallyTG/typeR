library(mdmb)


### Name: remove_NA_data_frame
### Title: Removes Rows with Some Missing Entries in a Data Frame
### Aliases: remove_NA_data_frame

### ** Examples

#############################################################################
# EXAMPLE 1: Removing rows in a data frame (listwise deletion)
#############################################################################

data(data.ma01, package="miceadds")
dat <- data.ma01

#*** remove rows with some missings according to a formula
dat1 <- mdmb::remove_NA_data_frame( formula=read ~ migrant + books, data=dat)

#*** remove rows according to two formulas
formula1 <- read ~ migrant + books
formula2 <- paredu ~ migrant + female
# create formula consisting of formula1 and formula2
formula3 <- paste( "~", deparse(formula1[[2]]), "+", deparse(formula1[[3]]),
             " + ", deparse(formula2[[2]]), "+", deparse(formula2[[3]])  )
dat2 <- mdmb::remove_NA_data_frame( formula=as.formula(formula3), data=dat)

dim(dat)
dim(dat1$data)
dim(dat2$data)
  ##  > dim(dat)
  ##  [1] 4073   11
  ##  > dim(dat1$data)
  ##  [1] 3371   11
  ##  > dim(dat2$data)
  ##  [1] 3090   11



