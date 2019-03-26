library(memisc)


### Name: data.set
### Title: Data Set Objects
### Aliases: data.set data.set-class initialize,data.set-method is.data.set
###   within,data.set-method print,data.set-method show,data.set-method
###   summary,data.set-method as.data.frame.data.set str.data.set
###   as.data.set as.data.set,list-method [<-,data.set-method
###   [,data.set,atomic,atomic,ANY-method
###   [,data.set,atomic,missing,ANY-method
###   [,data.set,missing,atomic,ANY-method
###   [,data.set,missing,missing,ANY-method dim,data.set-method
###   dimnames,data.set-method dimnames<-,data.set-method
###   row.names,data.set-method dsView

### ** Examples

Data <- data.set(
          vote = sample(c(1,2,3,8,9,97,99),size=300,replace=TRUE),
          region = sample(c(rep(1,3),rep(2,2),3,99),size=300,replace=TRUE),
          income = exp(rnorm(300,sd=.7))*2000
          )

Data <- within(Data,{
  description(vote) <- "Vote intention"
  description(region) <- "Region of residence"
  description(income) <- "Household income"
  wording(vote) <- "If a general election would take place next tuesday,
                    the candidate of which party would you vote for?"
  wording(income) <- "All things taken into account, how much do all
                    household members earn in sum?"
  foreach(x=c(vote,region),{
    measurement(x) <- "nominal"
    })
  measurement(income) <- "ratio"
  labels(vote) <- c(
                    Conservatives         =  1,
                    Labour                =  2,
                    "Liberal Democrats"   =  3,
                    "Don't know"          =  8,
                    "Answer refused"      =  9,
                    "Not applicable"      = 97,
                    "Not asked in survey" = 99)
  labels(region) <- c(
                    England               =  1,
                    Scotland              =  2,
                    Wales                 =  3,
                    "Not applicable"      = 97,
                    "Not asked in survey" = 99)
  foreach(x=c(vote,region,income),{
    annotation(x)["Remark"] <- "This is not a real survey item, of course ..."
    })
  missing.values(vote) <- c(8,9,97,99)
  missing.values(region) <- c(97,99)

  # These to variables do not appear in the
  # the resulting data set, since they have the wrong length.
  junk1 <- 1:5
  junk2 <- matrix(5,4,4)
  
})
# Since data sets may be huge, only a
# part of them are 'show'n
Data

## Not run: 
##D 
##D # If we insist on seeing all, we can use 'print' instead
##D print(Data)
## End(Not run)

str(Data)
summary(Data)

## Not run: 
##D 
##D # If we want to 'View' a data set we can use 'dsView'
##D dsView(Data)
##D # Works also, but changes the data set into a data frame first:
##D View(Data)
## End(Not run)

Data[[1]]
Data[1,]
head(as.data.frame(Data))

EnglandData <- subset(Data,region == "England")
EnglandData

xtabs(~vote+region,data=Data)
xtabs(~vote+region,data=within(Data, vote <- include.missings(vote)))



