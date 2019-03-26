library(Claddis)


### Name: MorphDistMatrix
### Title: Get distance matrices from a cladistic matrix
### Aliases: MorphDistMatrix
### Keywords: distance

### ** Examples


# Get morphological distances for the Day et
# al. (2016) data set:
distances <- MorphDistMatrix(Day2016)

# Show distance metric:
distances$DistanceMetric

# Show distance matrix:
distances$DistanceMatrix

# Show number of characters that can be scored for
# each pairwise comparison:
distances$ComparableCharacterMatrix

# To repeat using the Hopkins and St John approach
# we first need to define the character dependency
# (here there is only one, character 8 is a
# secondary where 7 is the primary character):
CharacterDependencies <- matrix(c(8, 7), ncol = 2,
  byrow = TRUE, dimnames = list(c(),
  c("DependentCharacter",
  "IndependentCharacter")))

# Get morphological distances for the Day et
# al. (2016) data set using HSJ approach:
distances <- MorphDistMatrix(Day2016,
  InapplicableBehaviour = "HSJ",
  CharacterDependencies = CharacterDependencies,
  Alpha = 0.5)

# Show distance metric:
distances$DistanceMetric

# Show distance matrix:
distances$DistanceMatrix

# Show number of characters that can be scored for
# each pairwise comparison:
distances$ComparableCharacterMatrix




