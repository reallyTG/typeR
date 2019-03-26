library(miceadds)


### Name: subset_datlist
### Title: Subsetting Multiply Imputed Datasets and Nested Multiply Imputed
###   Datasets
### Aliases: subset_datlist subset.datlist subset.imputationList
###   subset.mids subset.mids.1chain subset_nested.datlist
###   subset.nested.datlist subset.NestedImputationList
### Keywords: subset

### ** Examples

#############################################################################
# EXAMPLE 1: Subsetting and selection of multiply imputed datasets
#############################################################################

data(data.ma02)

# define original list of datasets
datlist1a <- data.ma02
# object of class datlist
datlist1b <- miceadds::datlist_create(datlist1a)
datlist1b
# object of class imputationList
datlist1c <- mitools::imputationList(datlist1a)
datlist1c
# object of class mids
datlist1d <- miceadds::datlist2mids(datlist1a)
datlist1d

# select some imputed datasets
datlist2a <- miceadds::subset_datlist( datlist1a, index=c(5,3,7) )
datlist2a
# convert to class imputationList
datlist2b <- miceadds::subset_datlist( datlist1a, index=c(5,3,7),
                      toclass="imputationList")
datlist2b
# convert to class mids
datlist2c <- miceadds::subset_datlist( datlist1a, index=1:3, toclass="mids")
datlist2c

## Not run: 
##D # select some variables
##D datlist3a <- miceadds::subset_datlist( datlist1a, select=c("idstud", "books")  )
##D datlist3a
##D # Because datlist1b is a datlist it is equivalent to
##D datlist3b <- subset( datlist1b, select=c("idstud", "books")  )
##D datlist3b
##D # operating on imputationList class
##D datlist3c <- miceadds::subset_datlist( datlist1c, select=c("idstud", "books")  )
##D datlist3c
##D # operating on mids class
##D datlist3d <- miceadds::subset_datlist( datlist1d, select=c("idstud", "books")  )
##D datlist3d
##D # selection of rows and columns in multiply imputed datasets
##D datlist4a <- miceadds::subset_datlist( datlist1a, index=1:5,
##D                   subset=datlist1a[[1]]$idschool < 1067,
##D                   select=c("idstud", "idschool","hisei") )
##D datlist4a
##D # convert to class mids
##D datlist4b <- miceadds::subset_datlist( datlist1a, index=1:5,
##D                   subset=datlist1a[[1]]$idschool < 1067,
##D                   select=c("idstud", "idschool","hisei"), toclass="mids" )
##D datlist4b
##D # The same functionality, but now applying to object of class mids datlist1d
##D datlist4c <- subset( datlist1d, index=1:5, subset=datlist1a[[1]]$idschool < 1067,
##D                      select=c("idstud", "idschool","hisei")  )
##D datlist4c
##D 
##D # expression for selecting rows specific in each data frame
##D # which can result in differently sized datasets (because the variable
##D # migrant is imputed)
##D datlist5a <- miceadds::subset_datlist( datlist1a,  expr_subset=migrant==1 )
##D datlist5a
##D 
##D # select the first 100 cases
##D datlist6a <- miceadds::subset_datlist( datlist1a, select=c("idstud", "books"),
##D                        subset=1:100 )
##D datlist6a
##D 
##D #############################################################################
##D # EXAMPLE 2: Subsetting and selection of nested multiply imputed datasets
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss4, package="BIFIEsurvey")
##D dat <- data.timss4
##D 
##D # create object of class 'nested.datlist'
##D datlist1a <- miceadds::nested.datlist_create( dat )
##D # create object of class 'NestedImputationList'
##D datlist1b <- miceadds::NestedImputationList(dat)
##D # create object of class 'mids.nmi'
##D datlist1c <- miceadds::datlist2mids(dat)
##D 
##D # select some between datasets
##D datlist2a <- subset_nested.datlist( datlist1a, index_between=c(1,3,4) )
##D datlist2a
##D # shorter version
##D datlist2b <- subset( datlist1a, index_between=c(1,3,4) )
##D datlist2b
##D # conversion of a NestedImputationList
##D datlist2c <- subset( datlist1b, index_between=c(1,3,4))
##D datlist2c
##D # select rows and columns
##D sel_cases <- datlist1a[[1]][[1]]$JKZONE <=42
##D datlist3a <- subset( datlist1a, subset=sel_cases,
##D                  select=c("IDSTUD","books", "ASMMAT") )
##D datlist3a
##D # remove within nest
##D datlist4a <- subset( datlist1a, index_within=1 )
##D datlist4a
##D # remove within nest and simplify structure
##D datlist4b <- subset( datlist1a, index_within=1, simplify=TRUE)
##D datlist4b
##D datlist4c <- subset( datlist1b, index_within=1, simplify=TRUE)
##D datlist4c
##D # remove between nest
##D datlist5a <- subset( datlist1a, index_between=1, simplify=TRUE)
##D datlist5a
##D datlist5b <- subset( datlist1b, index_between=1, simplify=TRUE)
##D datlist5b
## End(Not run)



