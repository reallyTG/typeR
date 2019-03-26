## ------------------------------------------------------------------------
library(jiebaR)

##  Using default settings to initialize a worker.
cutter = worker()

###  Note: Can not display Chinese characters here.

segment( "This is a good day!" , cutter )

## OR cutter["This is a good day!"]


## ------------------------------------------------------------------------
segment( "./temp.dat" , cutter ) ### Auto encoding detection.

## ------------------------------------------------------------------------
cutter$encoding
cutter$detect
cutter$detect = F
cutter$detect

## ------------------------------------------------------------------------
show_dictpath() ### Show path
?edit_dict()   ### For more information

## ------------------------------------------------------------------------
words = "hello world"
tagger = worker("tag")
tagger[words]

## ------------------------------------------------------------------------
keys = worker("keywords", topn = 1)
keys <= "words of fun"

## ------------------------------------------------------------------------
 words = "hello world"
 simhasher = worker("simhash",topn=1)
 simhasher[words]

## ------------------------------------------------------------------------
distance("hello world" , "hello world!" , simhasher)

