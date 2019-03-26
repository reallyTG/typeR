library(votesys)


### Name: list2ballot
### Title: Repeat ith element of list x or row of matrix/data.frames for j
###   times
### Aliases: list2ballot

### ** Examples

# Use x and n
unique_ballot <- list(
    c("A", "B", "C"), c("F", "A", "B"),
    c("E", "D", "C", "B", "F", "A"), c("x","x", "A")
)
r <- c(1, 2, 3, 0)
y <- list2ballot(unique_ballot, r)

# Use string, x and n will be ignored.
# The characters can be written in a very loose way as follows, 
# for the function will automatically delete unwanted parts.
# But do make sure there is no space or punctuation
# inside the names.
unique_ballot <- c(
	"2, Bob, Mike Jane", 	"3: barack_obama;;Bob>Jane", 
	"0 Smith   Jane", "  1 Mike???!!!"
)
y <- list2ballot(string = unique_ballot)
# Use a matrix.
m <- matrix(c(1, 2, 3, 3, 1, 2), nrow = 2, byrow = TRUE)
colnames(m) <- c("p1", "p2", "p3")
r <- c(3, 5)
y <- list2ballot(m = m, n = r)



