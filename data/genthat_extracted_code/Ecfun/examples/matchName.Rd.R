library(Ecfun)


### Name: matchName
### Title: Match surname and givenName in a table
### Aliases: matchName matchName1
### Keywords: manip

### ** Examples

##
## 1.  Names to match exercising many possibile combinations 
##     of surname with 0, 1, >1 matches possibly after 
##     replacing with subNonStandardNames 
##     combined with possibly multiple givenName combinations 
##     with 0, 1, >1 matches possibly requiring replacing with 
##     subNonStandardNames or nicknames 
##
# NOTE:  "-" could also be "e" with an accent;  
#    not included with this documentation, because 
#    non-English characters generate warnings in standard tests.  
Names2mtch <- c("Andr_ Bruce C_rdenas", "Dolores Ella Feinstein",
           "George Homer", "Inez Jane Kappa", "Luke Michael Noel", 
           "Oscar Papa", "Quincy Ra_l Stevens", 
           "Thomas U. Vel_zquez", "William X. Young", 
           "Zebra")
##
## 2.  Data = matrix(..., byrow=TRUE) to exercise the combinations 
##     the combinations from 1 
##
Data1 <- matrix(c("Feld", "Don", "789", 
                  "C_rdenas", "Don", "456", 
                  "C_rdenas", "Andre B.", "123", 
                  "Smith", "George", "aaa", 
                  "Young", "Bill", "369"), 
                ncol=3, byrow=TRUE)
Data1. <- subNonStandardNames(Data1)                
##
## 3.  matchName1
##        
parceNm1 <- parseName(Names2mtch)
match1.1 <- matchName1(parceNm1[, 'surname'], Data1.)

# check
match1.1s <- vector('list', 10)
match1.1s[[1]] <- 2:3
match1.1s[[9]] <- 5
names(match1.1s) <- parceNm1[, 'surname'] 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(match1.1, match1.1s)
## Don't show: 
)
## End(Don't show)

##
## 4.  matchName1 with name = multiple columns 
##
match1.2 <- matchName1(c('Cardenas', 'Don'), Data1., 
                       name=Data1.[, 1:2])

# check 
match1.2a <- list(Cardenas=2:3, Don=1:2)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(match1.2, match1.2a)
## Don't show: 
)
## End(Don't show)

##
## 5.  matchName 
##
nickNames <- matrix(c("William", "Bill"), 1, byrow=TRUE)

match1 <- matchName(Names2mtch, Data1, nicknames=nickNames)
                  
# check 
match1a <- list("Cardenas, Andre Bruce"=Data1[3,, drop=FALSE ], 
                "Feinstein, Dolores Ella"=NULL, 
                "Homer, George"=NULL, "Kappa, Inez Jane"=NULL, 
                "Noel, Luke Michael"=NULL, "Papa, Oscar"=NULL, 
                "Stevens, Quincy Raul"=NULL, 
                "Velazquez, Thomas U."=NULL, 
                "Young, William X."=Data1[5,, drop=FALSE], 
                "Zebra"=NULL)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(match1, match1a)
## Don't show: 
)
## End(Don't show)
##
## 6.  namesNotFound 
##
tstNotFound <- matchName('xx_x', Data1)

# check 
tstNF <- list('xx_x'=NULL)
attr(tstNF, 'namesNotFound') <- 'xx_x'
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tstNotFound, tstNF)
## Don't show: 
)
## End(Don't show)

##
## 7.  matchName(NULL) to simplify use 
##
mtchNULL <- matchName(NULL, Data1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(mtchNULL, NULL)
## Don't show: 
)
## End(Don't show)



