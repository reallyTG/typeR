library(mirt)


### Name: key2binary
### Title: Score a test by converting response patterns to binary data
### Aliases: key2binary

### ** Examples


data(SAT12)
head(SAT12)
key <- c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5)

dicho.SAT12 <- key2binary(SAT12, key)
head(dicho.SAT12)

# multiple scoring keys
key2 <- cbind(c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5),
              c(2,3,NA,1,rep(NA, 28)))
dicho.SAT12 <- key2binary(SAT12, key2)

# keys from raw character responses
resp <- as.data.frame(matrix(c(
  "B","B","D","D","E",
  "B","A","D","D","E",
  "B","A","D","C","E",
  "D","D","D","C","E",
  "B","C","A","D","A"), ncol=5, byrow=TRUE))

key <- c("B", "D", "D", "C", "E")

d01 <- key2binary(resp, key)
head(d01)

# score/don't score missing values
resp[1,1] <- NA
d01NA <- key2binary(resp, key) # without scoring
d01NA

d01 <- key2binary(resp, key, score_missing = TRUE) # with scoring
d01





