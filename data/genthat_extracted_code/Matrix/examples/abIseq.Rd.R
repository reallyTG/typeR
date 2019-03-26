library(Matrix)


### Name: abIseq
### Title: Sequence Generation of "abIndex", Abstract Index Vectors
### Aliases: abIseq abIseq1 c.abIndex
### Keywords: manip classes

### ** Examples

stopifnot(identical(-3:20,
                    as(abIseq1(-3,20), "vector")))

try( ## (arithmetic) not yet implemented
abIseq(1, 50, by = 3)
)




