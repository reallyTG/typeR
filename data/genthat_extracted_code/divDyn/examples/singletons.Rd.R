library(divDyn)


### Name: singletons
### Title: List of singleton taxa
### Aliases: singletons

### ** Examples

# load example dataset
  data(corals)

# Example 1. single-occurrence taxa
  singOcc <- singletons(corals, tax="genus", bin="stg")

# Example 2. output for every bin
  singOccBin <- singletons(corals, tax="genus", bin="stg", bybin=TRUE)

# Example 3. single-interval taxa (all)
  singInt <- singletons(corals, tax="genus", var="stg")

# Example 4. single interval taxa (for every bin)
  singIntBin <- singletons(corals, tax="genus", var="stg", bin="stg", bybin=TRUE)

# Example 5. single reference taxa (total dataset)
  singRef <- singletons(corals, tax="genus", var="reference_no")

#  Example 6. single reference taxa (see description for differences )
  singRefBin <- singletons(corals, tax="genus", var="reference_no", bin="stg", bybin=TRUE)




