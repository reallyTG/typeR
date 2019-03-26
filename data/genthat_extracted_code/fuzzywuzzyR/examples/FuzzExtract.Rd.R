library(fuzzywuzzyR)


### Name: FuzzExtract
### Title: Fuzzy extraction from a sequence
### Aliases: FuzzExtract
### Keywords: datasets

### ** Examples


if (check_availability()) {


  library(fuzzywuzzyR)

  word = "new york jets"

  choices = c("Atlanta Falcons", "New York Jets", "New York Giants", "Dallas Cowboys")

  duplicat = c('Frodo Baggins', 'Tom Sawyer', 'Bilbo Baggin', 'Samuel L. Jackson',

               'F. Baggins', 'Frody Baggins', 'Bilbo Baggins')

  #------------
  # processor :
  #------------

  init_proc = FuzzUtils$new()

  PROC = init_proc$Full_process    # class process-method

  PROC1 = tolower                  # base R function

  #---------
  # scorer :
  #---------

  init_scor = FuzzMatcher$new()

  SCOR = init_scor$WRATIO


  init <- FuzzExtract$new()

  init$Extract(string = word, sequence_strings = choices, processor = PROC, scorer = SCOR)

  init$ExtractBests(string = word, sequence_strings = choices, processor = PROC1,

                    scorer = SCOR, score_cutoff = 0L, limit = 2L)

  init$ExtractWithoutOrder(string = word, sequence_strings = choices, processor = PROC,

                           scorer = SCOR, score_cutoff = 0L)

  init$ExtractOne(string = word, sequence_strings = choices, processor = PROC,

                  scorer = SCOR, score_cutoff = 0L)

  init$Dedupe(contains_dupes = duplicat, threshold = 70L, scorer = SCOR)


}



