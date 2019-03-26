library(RndTexExams)


### Name: rte.The.Randomizer
### Title: Function to randomize a question in a dataframe (internal use)
### Aliases: rte.The.Randomizer

### ** Examples

q.text <- '\\question Whats my name \\n'
q.answers <- c('\\choice Mario', '\\choice Roberto','\\choice Marcelo')

case.now <- 1
my.rdn.idx.answers <- sample(seq(length(q.answers)))

l.out <- rte.The.Randomizer(q.text,q.answers, case.now, my.rdn.idx.answers)



