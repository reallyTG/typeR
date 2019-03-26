library(HadoopStreaming)


### Name: HadoopStreaming-package
### Title: Functions facilitating Hadoop streaming with R.
### Aliases: HadoopStreaming-package HadoopStreaming
### Keywords: package

### ** Examples

## STEP 1: MAKE A CONNECTION

## To read from STDIN (used for deployment in Hadoop streaming and for command line testing)
con = file(description="stdin",open="r")

## Reading from a text string: useful for very small test examples
str <- "Key1\tVal1\nKey2\tVal2\nKey3\tVal3\n"
cat(str)
con <- textConnection(str, open = "r")

## Reading from a file: useful for testing purposes during development
cat(str,file="datafile.txt")            # write datafile.txt data in str 
con <- file("datafile.txt",open="r")

## To get the first few lines of a file (also very useful for testing)
numlines = 2
con <- pipe(paste("head -n",numlines,'datafile.txt'), "r")

## STEP 2: Write map and reduce scripts, call them mapper.R and
## reducer.R. Alternatively, write a single script taking command line
## flags specifying whether it should run as a mapper or reducer.  The
## hsCmdLineArgs function can assist with this.
## Writing #!/usr/bin/env Rscript can make an R file executable from the command line.

## STEP 3a: Running  on command line with separate mappers and reducers
## cat inputFile | Rscript mapper.R | sort | Rscript reducer.R
## OR
## cat inputFile | R --vanilla --slave -f mapper.R | sort | R --vanilla --slave -f reducer.R

## STEP 3b: Running on command line with the recommended single file
## approach using Rscript and the hsCmdLineArgs for argument parsing.
## cat inputFile | ./mapReduce.R --mapper | sort | ./mapReduce.R --reducer

## STEP 3c: Running in Hadoop -- Assuming mapper.R and reducer.R can
## run on each computer in the cluster:
## $HADOOP_HOME/bin/hadoop $HADOOP_HOME/contrib/streaming/hadoop-0.19.0-streaming.jar \
##   -input inpath -output outpath -mapper \
##   "R --vanilla --slave -f mapper.R" -reducer "R --vanilla --slave -f reducer.R" \
##    -file ./mapper.R -file ./reducer.R

## STEP 3d: Running in Hadoop, with the recommended single file method:
## $HADOOP_HOME/bin/hadoop $HADOOP_HOME/contrib/streaming/hadoop-0.19.0-streaming.jar \
##   -input inpath -output outpath -mapper \
##   "mapReduce.R --mapper" -reducer "mapReduce.R --reducer" \
##    -file ./mapReduce.R



