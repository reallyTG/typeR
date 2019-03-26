library(mglR)


### Name: makeCoXpTranscript
### Title: Tests pairwise co-expression between user defined transcripts in
###   specified tissues
### Aliases: makeCoXpTranscript

### ** Examples

exMgl() -> myMgl
makeCoXpTranscript(myMgl, transcripts = 
    c('ENST00000344348', 'ENST00000414907', 'ENST00000478719'), 
    genes = c('NCOA4', 'NCOA4', 'MSMB'), tissue = c('Prostate'), 
    data = 9, makePlot = FALSE, saveFile = FALSE)




