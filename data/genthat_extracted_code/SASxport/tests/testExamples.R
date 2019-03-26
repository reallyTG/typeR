library(SASxport)
Sys.setenv("TZ"="GMT")
Sys.setlocale(locale="C")

set.seed(42)

# run the examples, comparing output
example(Alfalfa)
example(SASformat)
example(lookup.xport)
example(makeSASNames)
example(read.xport)
example(toSAS)
example(write.xport)

