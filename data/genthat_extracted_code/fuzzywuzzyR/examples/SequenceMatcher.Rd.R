library(fuzzywuzzyR)


### Name: SequenceMatcher
### Title: Character string sequence matching
### Aliases: SequenceMatcher
### Keywords: datasets

### ** Examples


if (check_availability()) {


  library(fuzzywuzzyR)

  s1 = ' It was a dark and stormy night. I was all alone sitting on a red chair.'

  s2 = ' It was a murky and stormy night. I was all alone sitting on a crimson chair.'

  init = SequenceMatcher$new(string1 = s1, string2 = s2)

  init$ratio()

  init$quick_ratio()

  init$real_quick_ratio()

  init$get_matching_blocks()

  init$get_opcodes()


}



