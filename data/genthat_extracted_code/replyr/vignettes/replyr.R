## ---- echo = FALSE--------------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = " # "
)
options(width =100)

## ----message=FALSE,results='hide',warning=FALSE---------------------------------------------------
library('dplyr')

## ----letexample-----------------------------------------------------------------------------------
# nice parametric function we write
ComputeRatioOfColumns <- function(d,
                                  NumeratorColumnName,
                                  DenominatorColumnName,
                                  ResultColumnName) {
  wrapr::let(
    alias=list(NumeratorColumn=NumeratorColumnName,
               DenominatorColumn=DenominatorColumnName,
               ResultColumn=ResultColumnName),
    expr={
      # (pretend) large block of code written with concrete column names.
      # due to the let wrapper in this function it will behave as if it was
      # using the specified paremetric column names.
      d %>% mutate(ResultColumn = NumeratorColumn/DenominatorColumn)
    })
}

# example data
d <- data.frame(a=1:5, b=3:7)

# example application
d %>% ComputeRatioOfColumns('a','b','c')

## ----rankfn---------------------------------------------------------------------------------------
# an external function with hard-coded column names
DecreaseRankColumnByOne <- function(d) {
  d$RankColumn <- d$RankColumn - 1
  d
}

## ----replyrmapf-----------------------------------------------------------------------------------
# our data
d <- data.frame(Sepal_Length = c(5.8,5.7),
                Sepal_Width = c(4.0,4.4),
                Species = 'setosa',
                rank = c(1,2))

# a wrapper to introduce parameters
DecreaseRankColumnByOneNamed <- function(d, ColName) {
  replyr::replyr_apply_f_mapped(d, 
                                f = DecreaseRankColumnByOne, 
                                nmap = c(RankColumn = ColName),
                                restrictMapIn = FALSE, 
                                restrictMapOut = FALSE)
}

# use
dF <- DecreaseRankColumnByOneNamed(d, 'rank')
print(dF)

## ----message=FALSE,results='hide',warning=FALSE---------------------------------------------------
library('dplyr')

## ----gapplyexample--------------------------------------------------------------------------------
d <- data.frame(group=c(1,1,2,2,2),
                order=c(.1,.2,.3,.4,.5))
rank_in_group <- . %>% mutate(constcol=1) %>%
          mutate(rank=cumsum(constcol)) %>% select(-constcol)
d %>% replyr::gapply('group', rank_in_group, ocolumn='order', decreasing=TRUE)

## ----summaryexample-------------------------------------------------------------------------------
d <- data.frame(x=c(1,2,2),y=c(3,5,NA),z=c(NA,'a','b'),
                stringsAsFactors = FALSE)
if (requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  dRemote <- replyr::replyr_copy_to(my_db,d,'d')
} else {
  dRemote <- d # local stand in when we can't make remote
}

summary(dRemote)

replyr::replyr_summary(dRemote)

## ----message=FALSE,results='hide',warning=FALSE---------------------------------------------------
library('dplyr')

## ----filter---------------------------------------------------------------------------------------
values <- c(2)
dRemote %>% replyr::replyr_filter('x', values)

## -------------------------------------------------------------------------------------------------
DBI::dbDisconnect(my_db)
rm(list=ls())
gc()

