library(clue)


### Name: cl_fuzziness
### Title: Partition Fuzziness
### Aliases: cl_fuzziness
### Keywords: cluster

### ** Examples

if(require("e1071", quiet = TRUE)) {
    ## Use an on-line version of fuzzy c-means from package e1071 if
    ## available.
    data("Cassini")
    pens <- cl_boot(Cassini$x, B = 15, k = 3, algorithm = "cmeans",
                    parameters = list(method = "ufcl"))
    pens
    summary(cl_fuzziness(pens, "PC"))
    summary(cl_fuzziness(pens, "PE"))
}



