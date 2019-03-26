library(multcompView)


### Name: vec2mat
### Title: Convert a vector with hyphenated names into a matrix.
### Aliases: vec2mat
### Keywords: array manip

### ** Examples

dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("a-b", "a-c", "b-c")
vec2mat(dif3)

dif3. <- 1:3
names(dif3.) <- c("a-b", "a-c", "b-c")
vec2mat(dif3.)

dif.ch <- c("this",'is','it')
names(dif.ch) <- c("a-b", "a-c", "b-c")
vec2mat(dif.ch)

vec2mat(array(1, dim=c(2,2)))
## Don't show: 
  try(vec2mat(array(1:24, dim=2:4)))# must be 2-d
  try(vec2mat(array(1:6, dim=2:3)))# must be square
  try(vec2mat(array(1:4, dim=c(2,2))))# must be symmetric
  try(vec2mat(array(1, dim=c(2,2)))) # diag should be 0
  try(vec2mat(array(TRUE, dim=c(2,2)))) # diag should be FALSE
  try(vec2mat(array("a", dim=c(2,2)))) # diag should be ""

  try(vec2mat(c(1:3, NA))) # NAs not allowed
  try(vec2mat(1:3))# Error:  No names

  errVec2 <- 1:3
  names(errVec2) <- c("a", "b-a", "b-c")
  try(vec2mat(errVec2))# Error:  missing hyphen (sep character)

  errVec3 <- 1:3
  names(errVec3) <- c("a-c", "b-a", "b-c-d")
  try(vec2mat(errVec3))
# Error:  multiple hyphens (sep characters)

  dif4 <- 1:4
  names(dif4) <- c("a-b", "a-c", "b-c", "b-a")
# Both "b-a" and "a-b" specified;
# use the latest.
  vec2mat(dif4)
## End(Don't show)



