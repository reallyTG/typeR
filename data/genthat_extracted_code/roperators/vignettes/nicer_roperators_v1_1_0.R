## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
require(roperators)
# require(magrittr)

iris_data <- iris

## ------------------------------------------------------------------------
require(roperators)
my_string <- 'using infix (%) operators ' %+% 'R can do simple string addition'
print(my_string)

## ------------------------------------------------------------------------
my_string %-% 'R can do simple string addition'

## ------------------------------------------------------------------------
my_a <- 'a'
my_a %s*% 3
# If a is an unnamed vector, the original value is saved as the element name(s)
# just to make it easier to undo by my_a <- names(my_a)

## ------------------------------------------------------------------------
# How many times does the letter a appear in the string
'an apple a day keeps the malignant spirit of Steve Jobs at bay' %s/% 'a' 

## ------------------------------------------------------------------------
# How many times is Steve Jobs or apple mentioned?
'an apple a day keeps the malignant spirit of Steve Jobs at bay' %s/% 'Steve Jobs|apple' 

## ---- eval = FALSE-------------------------------------------------------
#  iris_data$Sepal.Length <- iris_data$Sepal.Length + 1

## ------------------------------------------------------------------------
iris_data$Sepal.Length[iris_data$Species == 'setosa'] <- iris_data$Sepal.Length[iris_data$Species == 'setosa'] + 1
# ...which may not even fit on the page. 

## ---- eval = FALSE-------------------------------------------------------
#  iris_data$Sepal.Length %+=% 1

## ------------------------------------------------------------------------
iris_data$Sepal.Length[iris_data$Species == 'setosa'] %+=% 1
# ...which is ike a breath of fresh air

## ------------------------------------------------------------------------
x <- c("a1b", "b1", "c", "d0")
# Replace digits with the letter x
x %regex=% c("\\d+", "i")
 # x is now c("aib", "bi", "c", "di")
print(x)

## ------------------------------------------------------------------------
x <- c(NA, 1, 2, 3)
x %na<-% 0
print(x)

## ------------------------------------------------------------------------
x <- c("aib", "bi", "c", "di")
x %regex<-% c('i', '[redacted]')
print(x)

## ------------------------------------------------------------------------
x <- c(NA, 'foo', 'foo', NA)
y <- c(NA, 'foo', 'bar', 'bar')

x %==% y

## ------------------------------------------------------------------------
x == y

## ---- eval=FALSE---------------------------------------------------------
#  (0.1 * 3) == 0.3  # FALSE
#  (0.1 * 5) == 0.5  # TRUE
#  (0.1 * 7) == 0.7  # FALSE
#  (0.1 * 11) == 1.1 # TRUE
#  
#  (0.1 * 3) >= 0.3 # TRUE
#  (0.1 * 3) <= 0.3 # FALSE

## ---- eval=FALSE---------------------------------------------------------
#  (0.1 * 3)  %~=% 0.3  # TRUE
#  (0.1 * 5)  %~=% 0.5  # TRUE
#  (0.1 * 7)  %~=% 0.7  # TRUE
#  (0.1 * 11) %~=% 1.1  # TRUE
#  
#  (0.1 * 3) %>~% 0.3 #TRUE
#  (0.1 * 3) %<~% 0.3 #TRUE

## ---- eval=FALSE---------------------------------------------------------
#  isTRUE(all.equal(0.1 * 3, 0.3))  # TRUE
#  isTRUE(all.equal(0.1 * 5, 0.5))  # TRUE
#  isTRUE(all.equal(0.1 * 7, 0.7))  # TRUE
#  isTRUE(all.equal(0.1 * 11, 1.1))  # TRUE
#  
#  
#  isTRUE(all.equal(0.1 * 3, 0.3)) | ((0.1 * 3) > 0.3)
#  isTRUE(all.equal(0.1 * 3, 0.3)) | ((0.1 * 3) < 0.3)
#  # I feel dirty even typing that as an example.

## ------------------------------------------------------------------------
5 %><% c(1, 10)  # TRUE
1 %><% c(1, 10)  # FALSE
1 %>=<% c(1, 10) # TRUE

# note that due to my simple mindedness, at the time of writing, 5 %><% c(10, 1) is FALSE

## ------------------------------------------------------------------------
!1 %in% c(2,3,4)

## ------------------------------------------------------------------------
1 %ni% c(2,3,4)

## ---- eval=FALSE---------------------------------------------------------
#  if((a|b) & xor(y, z))

## ---- eval=FALSE---------------------------------------------------------
#  if((a|b) & (y %xor% z))

## ---- eval=FALSE---------------------------------------------------------
#  if((a*2 == b+2) %aon% (x^2 == y*10))
#  # Compared to
#  if((a*2 == b+2) == (x^2 == y*10))
#  # which takes my brain a little bit more time to read

## ------------------------------------------------------------------------
x <- c('TRUE', 'FALSE', 'TRUE', 'TRUE')

percent_true <- paste0(sum(as.integer(as.logical(x))) / length(x)*100, '%')
print(percent_true)


## ------------------------------------------------------------------------
percent_true <- (sum(int(bool(x))) / length(x) * 100) %+% '%'
print(percent_true)

## ---- eval=FALSE---------------------------------------------------------
#  if(is.atomic(x) & (length(x) >= 1) & !is.na(x) & !is_nan(x) & !is.na(as.numeric(x)) & !is.factor(x) & !is.infinite(x) ){
#    ...
#  }

## ---- eval = FALSE-------------------------------------------------------
#  if(!is.bad_for_calcs(x)){
#    ...
#  }

