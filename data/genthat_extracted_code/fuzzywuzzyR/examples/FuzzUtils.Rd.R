library(fuzzywuzzyR)


### Name: FuzzUtils
### Title: Utility functions
### Aliases: FuzzUtils
### Keywords: datasets

### ** Examples


if (check_availability()) {


  library(fuzzywuzzyR)

  s1 = 'Frodo Baggins'

  s2 = 'Bilbo Baggin'

  init = FuzzUtils$new()

  init$Full_process(string = s1, force_ascii = TRUE)

  init$INTR(n = 2.0)

  init$Make_type_consistent(string1 = s1, string2 = s2)

  #------------------------------------
  # 'Asciidammit' with character string
  #------------------------------------

  init$Asciidammit(input = s1)

  #----------------------------------------------------------------
  # 'Asciidammit' with data.frame(123) [ or any kind of data type ]
  #----------------------------------------------------------------

  init$Asciidammit(input = data.frame(123))

  init$Asciionly(string = s1)

  init$Validate_string(string = s2)


}



