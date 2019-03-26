## ---- eval = F, echo = T-------------------------------------------------
#  
#  library(fuzzywuzzyR)
#  
#  word = "new york jets"
#  
#  choices = c("Atlanta Falcons", "New York Jets", "New York Giants", "Dallas Cowboys")
#  
#  
#  #------------
#  # processor :
#  #------------
#  
#  init_proc = FuzzUtils$new()      # initialization of FuzzUtils class to choose a processor
#  
#  PROC = init_proc$Full_process    # processor-method
#  
#  PROC1 = tolower                  # base R function ( as an example for a processor )
#  
#  #---------
#  # scorer :
#  #---------
#  
#  init_scor = FuzzMatcher$new()    # initialization of the scorer class
#  
#  SCOR = init_scor$WRATIO          # choosen scorer function
#  
#  
#  init <- FuzzExtract$new()        # Initialization of the FuzzExtract class
#  
#  init$Extract(string = word, sequence_strings = choices, processor = PROC, scorer = SCOR)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # example output
#  
#    [[1]]
#  [[1]][[1]]
#  [1] "New York Jets"
#  
#  [[1]][[2]]
#  [1] 100
#  
#  
#  [[2]]
#  [[2]][[1]]
#  [1] "New York Giants"
#  
#  [[2]][[2]]
#  [1] 79
#  
#  
#  [[3]]
#  [[3]][[1]]
#  [1] "Atlanta Falcons"
#  
#  [[3]][[2]]
#  [1] 29
#  
#  
#  [[4]]
#  [[4]][[1]]
#  [1] "Dallas Cowboys"
#  
#  [[4]][[2]]
#  [1] 22
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # extracts best matches (limited to 2 matches)
#  
#  init$ExtractBests(string = word, sequence_strings = choices, processor = PROC1,
#  
#                    scorer = SCOR, score_cutoff = 0L, limit = 2L)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [[1]]
#  [[1]][[1]]
#  [1] "New York Jets"
#  
#  [[1]][[2]]
#  [1] 100
#  
#  
#  [[2]]
#  [[2]][[1]]
#  [1] "New York Giants"
#  
#  [[2]][[2]]
#  [1] 79
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # extracts matches without keeping the output order
#  
#  init$ExtractWithoutOrder(string = word, sequence_strings = choices, processor = PROC,
#  
#                           scorer = SCOR, score_cutoff = 0L)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [[1]]
#  [[1]][[1]]
#  [1] "Atlanta Falcons"
#  
#  [[1]][[2]]
#  [1] 29
#  
#  
#  [[2]]
#  [[2]][[1]]
#  [1] "New York Jets"
#  
#  [[2]][[2]]
#  [1] 100
#  
#  
#  [[3]]
#  [[3]][[1]]
#  [1] "New York Giants"
#  
#  [[3]][[2]]
#  [1] 79
#  
#  
#  [[4]]
#  [[4]][[1]]
#  [1] "Dallas Cowboys"
#  
#  [[4]][[2]]
#  [1] 22
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # extracts first result
#  
#  init$ExtractOne(string = word, sequence_strings = choices, processor = PROC,
#  
#                  scorer = SCOR, score_cutoff = 0L)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [[1]]
#  [1] "New York Jets"
#  
#  [[2]]
#  [1] 100
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  duplicat = c('Frodo Baggins', 'Tom Sawyer', 'Bilbo Baggin', 'Samuel L. Jackson',
#  
#               'F. Baggins', 'Frody Baggins', 'Bilbo Baggins')
#  
#  
#  init$Dedupe(contains_dupes = duplicat, threshold = 70L, scorer = SCOR)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [1] "Frodo Baggins"     "Samuel L. Jackson" "Bilbo Baggins"     "Tom Sawyer"
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  s1 = "Atlanta Falcons"
#  
#  s2 = "New York Jets"
#  
#  init = FuzzMatcher$new()          initialization of FuzzMatcher class
#  
#  init$Partial_token_set_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)
#  
#  # example output
#  
#  [1] 31
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$Partial_token_sort_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)
#  
#  
#  [1] 31
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$Ratio(string1 = s1, string2 = s2)
#  
#  [1] 21
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$QRATIO(string1 = s1, string2 = s2, force_ascii = TRUE)
#  
#  [1] 29
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$WRATIO(string1 = s1, string2 = s2, force_ascii = TRUE)
#  
#  [1] 29
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$UWRATIO(string1 = s1, string2 = s2)
#  
#  [1] 29
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$UQRATIO(string1 = s1, string2 = s2)
#  
#  [1] 29
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$Token_sort_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)
#  
#  [1] 29
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  init$Partial_ratio(string1 = s1, string2 = s2)
#  
#  [1] 23
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$Token_set_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)
#  
#  [1] 29
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  s1 = 'Frodo Baggins'
#  
#  init = FuzzUtils$new()
#  
#  init$Full_process(string = s1, force_ascii = TRUE)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # example output
#  
#  [1] "frodo baggins"
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  vec = c('Frodo Baggins', 'Tom Sawyer', 'Bilbo Baggin')
#  
#  str1 = 'Fra Bagg'
#  
#  GetCloseMatches(string = str1, sequence_strings = vec, n = 2L, cutoff = 0.6)
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [1] "Frodo Baggins"
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  s1 = ' It was a dark and stormy night. I was all alone sitting on a red chair.'
#  
#  s2 = ' It was a murky and stormy night. I was all alone sitting on a crimson chair.'
#  
#  init = SequenceMatcher$new(string1 = s1, string2 = s2)
#  
#  init$ratio()
#  
#  [1] 0.9127517
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$quick_ratio()
#  
#  [1] 0.9127517
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$real_quick_ratio()
#  
#  [1] 0.966443
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  MCLAPPLY_RATIOS = function(QUERY1, QUERY2, class_fuzz = 'FuzzMatcher', method_fuzz = 'QRATIO', threads = 1, ...) {
#  
#    init <- eval(parse(text = paste0(class_fuzz, '$new()')))
#  
#    METHOD = paste0('init$', method_fuzz)
#  
#    if (threads == 1) {
#  
#      res_qrat = lapply(1:length(QUERY1), function(x) do.call(eval(parse(text = METHOD)), list(QUERY1[[x]], QUERY2[[x]], ...)))}
#  
#    else {
#  
#      res_qrat = parallel::mclapply(1:length(QUERY1), function(x) do.call(eval(parse(text = METHOD)), list(QUERY1[[x]], QUERY2[[x]], ...)), mc.cores = threads)
#    }
#  
#    return(res_qrat)
#  }
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  query1 = c('word1', 'word2', 'word3')
#  
#  query2 = c('similarword1', 'similar_word2', 'similarwor')
#  
#  quer_res = MCLAPPLY_RATIOS(query1, query2, class_fuzz = 'FuzzMatcher', method_fuzz = 'QRATIO', threads = 1)
#  
#  unlist(quer_res)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # example output
#  
#  [1] 59 56 40
#  

