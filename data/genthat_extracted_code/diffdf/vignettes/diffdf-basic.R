## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(diffdf)

LENGTH = 30
set.seed(12334)
test_data <- tibble::tibble( 
    ID          = 1:LENGTH,
    GROUP1      = rep( c(1,2) , each = LENGTH/2),
    GROUP2      = rep( c(1:(LENGTH/2)), 2 ),
    INTEGER     = rpois(LENGTH , 40),
    BINARY      = sample( c("M" , "F") , LENGTH , replace = T),
    DATE        = lubridate::ymd("2000-01-01") + rnorm(LENGTH, 0, 7000),
    DATETIME    = lubridate::ymd_hms("2000-01-01 00:00:00") + rnorm(LENGTH, 0, 200000000), 
    CONTINUOUS  = rnorm(LENGTH , 30 , 12),
    CATEGORICAL = factor(sample( c("A" , "B" , "C") , LENGTH , replace = T)),
    LOGICAL     = sample( c(TRUE , FALSE) , LENGTH , replace = T),
    CHARACTER   = stringi::stri_rand_strings(LENGTH,  rpois(LENGTH , 13),  pattern = "[ A-Za-z0-9]")
)

test_data

diffdf( test_data , test_data)

## ------------------------------------------------------------------------
test_data2 <- test_data 
test_data2 <- test_data2[,-6]
diffdf(test_data , test_data2 , suppress_warnings = T)

## ------------------------------------------------------------------------
test_data2 <- test_data
test_data2 <- test_data2[1:(nrow(test_data2) - 2),]
diffdf(test_data, test_data2 , suppress_warnings = T)

## ------------------------------------------------------------------------
test_data2 <- test_data
test_data2[5,2] <- 6
diffdf(test_data , test_data2 , suppress_warnings = T)

## ------------------------------------------------------------------------
test_data2 <- test_data
test_data2[5,2] <- "blah"
diffdf(test_data , test_data2 , suppress_warnings = T)

## ------------------------------------------------------------------------
test_data2 <- test_data
attr(test_data$ID , "label") <- "This is a interesting label"
attr(test_data2$ID , "label") <- "what do I type here?"
diffdf(test_data , test_data2 , suppress_warnings = T)

## ------------------------------------------------------------------------
test_data2 <- test_data
levels(test_data2$CATEGORICAL) <- c(1,2,3)
diffdf(test_data , test_data2 , suppress_warnings = T)

## ------------------------------------------------------------------------
test_data2 <- test_data
test_data2$INTEGER[c(5,2,15)] <- 99L 
diffdf( test_data , test_data2 , keys = c("GROUP1" , "GROUP2") , suppress_warnings = T)

## ---- eval=FALSE---------------------------------------------------------
#  result <- diffdf(
#      test_data ,
#      test_data2 ,
#      keys = c("GROUP1" , "GROUP2") ,
#      outfile =  "reports/diffdf.log"
#  )
#  

## ------------------------------------------------------------------------
iris2 <- iris
for (i in 1:3) iris2[i,i] <- 99
diff <- diffdf( iris , iris2, suppress_warnings = TRUE)
diffdf_issuerows( iris , diff)
diffdf_issuerows( iris2 , diff)

## ------------------------------------------------------------------------
diffdf_issuerows( iris2 , diff , vars = "Sepal.Length")
diffdf_issuerows( iris2 , diff , vars = c("Sepal.Length" , "Sepal.Width"))


## ------------------------------------------------------------------------
iris2 <- iris
for (i in 1:3) iris2[i,i] <- 99
diff <- diffdf( iris , iris2, suppress_warnings = TRUE)

diffdf_has_issues(diff)

## ----eval = FALSE--------------------------------------------------------
#  if ( diffdf_has_issues(diff)){
#      #<Further programming steps / logic>
#  }

## ------------------------------------------------------------------------
dsin1 <- data.frame(x = 1.1e-06)
dsin2 <- data.frame(x = 1.1e-07)

diffdf(dsin1  , dsin2 , suppress_warnings = T)

diffdf(dsin1  , dsin2 , tolerance = 0.001 , suppress_warnings = T)

## ------------------------------------------------------------------------
dsin1 <- data.frame(x = as.integer(c(1,2,3)))
dsin2 <- data.frame(x = as.numeric(c(1,2,3)))

diffdf(dsin1  , dsin2 , suppress_warnings = T)
diffdf(dsin1  , dsin2 , suppress_warnings = T, strict_numeric = FALSE)

dsin1 <- data.frame(x = as.character(c(1,2,3)), stringsAsFactors = FALSE)
dsin2 <- data.frame(x = as.factor(c(1,2,3)))

diffdf(dsin1  , dsin2 , suppress_warnings = T)
diffdf(dsin1  , dsin2 , suppress_warnings = T, strict_factor = FALSE)

