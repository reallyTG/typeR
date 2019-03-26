## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ">"
)
library(invctr)

## ------------------------------------------------------------------------
d <- data.frame(x=1:5, y=6, txt=paste0("delta = ",6-1:5), row.names=paste0("ri",5:1), stringsAsFactors = FALSE)
knitr::kable(d)

# Change a column name based on the current name
# colnames(d)[colnames(d)%in%"y"] <- "Yhat"
  colnames(d)["y"%ci%d] <- "Yhat" 
  1:3%ci%d

# Use a range of values in variable to change cells
# d$txt[d$x>=2&d$x<=4] <- "Changed!"
  d$txt[d$x%[]%c(2,4)] <- "Changed!"
  knitr::kable(d)

# Use row names to change cells
# d$txt[rownames(d)%in%c("ri2,ri4")] <- "Changed again!"
  d$txt[c("ri2","ri4")%ri%d] <- "Changed again!"
  knitr::kable(d)



## ------------------------------------------------------------------------
# Replace special numerical values
c(0,Inf,1,NA,2,NaN,3) %00% NA

# Also works with NULL
NULL %00% NA

# Length 0 vectors
logical(0) %00% NA

numeric(0) %00% "lenghth 0!!"
         0 %00% "lenghth 0!!"


## ------------------------------------------------------------------------
 # Signed increment
 # Notice the difference between passing an object and a value for counter

 # Value
 (11 %+-% -5)
 (11 %+-%  5)

 # Object
 i <- 11
 (i %+-% -5)
 (i %+-%  5)

 # This means we can use the infix in a while ... statement
 # WARNING: As is the case for any while ... statement, be careful not to create an infinite loop!
 i <- 5
 while(i > -5){
   i %+-% -1
   print(i)
 }

## ------------------------------------------------------------------------
 # Non-negative increment
 # Notice the difference between passing an object and a value for counter

 # Value
 (0 %++% 5)
 (0 %++% 5)

 # Object
 i <- 0
 (i %++% 5)
 (i %++% 5)

 # This means we can use the infix in a while ... statement
 # WARNING: As is the case for any while ... statement, be careful not to create an infinite loop!

 i <- 0
 while(i < 20){
 i %++% 5
 print(i)
 }
 

## ------------------------------------------------------------------------
set.seed(1234)
 (x <- round(runif(10,1,10)))

 # Pad front with 10 zeros
 x%[+%5
 # Same as
 x%[+% c(5,0)

 # Pad rear with zeros
 x%+]%5
 # Same as
 x%+]%c(5,0)

 # Pad front + rear with NA
 x%[+]%c(4,NA)

 # Pad front + rear of a character vector
 "yes"%[+]%c(2,"no")
 "yes"%[+]%c(1,"no")
 "yes"%[+]%c(0,"no")

## ------------------------------------------------------------------------
 set.seed(4321)
 (x <- round(runif(10,1,10)))

 # Trim front
 x%[-%5

 # Trim rear
 x%-]%5

 # Trim front + rear
 x%[-]%c(2,4)

 x%[-]%3

