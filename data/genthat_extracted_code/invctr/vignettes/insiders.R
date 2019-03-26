## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ">"
)
library(invctr)

## ------------------------------------------------------------------------
x <- 0:9

# Inside open interval
x %()% c(5,9)

# Inside closed interval
x %[]% c(5,9)

# Outside open interval
x %)(% c(5,9)

# Outside closed interval
x %][% c(5,9)

# All variations left/right open/closed are possible
x %[)% c(5,9)
x %](% c(5,9)

## ------------------------------------------------------------------------
# Regular indexing works, but is a bit 'wordy'
x[x %[]% c(5,9)]

# Easier to use the special functions
x %[.]% c(5,9)

# Extract first, last, or, middle value of x
x %:% "f"
x %:% "m"
x %:% "l"

# Simulate a sample from a standard normal distribution
set.seed(4321)
Zscore <- rnorm(100)

# Find Z-scores that are 'significant' at alpha = .05
Zscore %).(% c(-1.96,1.96)

# Old indexing has a lot of repetition, so does tidyverse, e.g. using filter()
Zscore[Zscore < -1.96 | Zscore > 1.96]


## ------------------------------------------------------------------------
# A character vector
z <- letters

# Extract front by first occurrence of value "n"
z %[f% "n"

# Extact first, middle, last of z
z %:% "f"
z %:% "m"
z %:% "l"

# Extract by percentile
seq(1,10,.5) %(q% .5 # infix
seq(1,10,.5)[seq(1,10,.5) < quantile(seq(1,10,.5),.5)] # regular syntax

seq(1,10,.5) %q]% .5 # infix
seq(1,10,.5)[seq(1,10,.5) >= quantile(seq(1,10,.5),.5)] # regular syntax

# Random uniform integers
set.seed(123)
x <- round(runif(100,1,100))

# Extract front up and untill index 10
x%[%10 # infix
x[1:10] # regular [saves just 1 char]

# Extract from index 90 to rear
x%]%90 # infix
x[90:length(x)] # regular

# Extract numbers from front to first occurrence of 11
x%[f%11 # infix
x[1:which(x==11)[1]] # regular

# Extract numbers from last occurrence of 11 to rear
x%l]%11 # infix
x[which(x==11)[length(which(x==11))]:length(x)] # regular

# Extract by indices if an index range provided
# This is a clear case in which the infix is less sensible to use than regular indexing:
x%]%c(6,10) # infix
x[6:10] # regular

z%[%c(6,10) #infix
z[6:10] #regular

## ----echo=FALSE----------------------------------------------------------
# data frame
d <- data.frame(x=1:5,y=6,txt=paste0("delta = ",6-1:5),row.names=paste0("ri",5:1))
knitr::kable(d)

## ------------------------------------------------------------------------
# Columns
 "txt"%ci%d # infix
 which(colnames(d)%in%"txt") # regular

 2%ci%d # infix
 colnames(d)[2] # regular
  
# Rows
 "ri4"%ri%d # infix
 which(rownames(d)%in%"ri4") # regular
 
 2%ri%d # infix
 rownames(d)[2] # regular
 
# Change column name
 colnames(d)["y"%ci%d] <- "Yhat" # infix
 colnames(d)[colnames(d)%in%"y"] <- "Yhat" # regular

## ------------------------------------------------------------------------
 l <- list(a=1:100, b=LETTERS)

 2%ci%l == 2%ri%l
 "a"%ci%l == "a"%ri%l

# Named vector
 v <- c("first" = 1, "2nd" = 1000)

 1%ci%v == 1%ri%v
 "2nd"%ci%v == "2nd"%ri%v

## ------------------------------------------------------------------------
# Data frame d
 c(5,2) %mi% d

 list(r="ri1",c=2) %mi% d

# matrix row and column indices
(m <- matrix(1:10,ncol=2, dimnames = list(paste0("ri",0:4),c("xx","yy"))))

 1 %ci% m
 5 %ci% m # no column 5

 1 %ri% m
 5 %ri% m

 c(5,1)%mi%m
 c(1,5)%mi%m

## ------------------------------------------------------------------------
# get all indices of the number 1 in v
 1 %ai% v

# get all indices of the number 3 and 6 in d
 c(3,6) %ai% d

 # Simulate a sample from a standard normal distribution
 set.seed(1234)
 Zscores <- rnorm(100)
 
 Zscores%).(%c(-1.96,1.96) %ai% Zscores # returns a data frame with values and indices
 
 which(Zscores%)(%c(-1.96,1.96)) # returns an index vector


