library(sunburstR)


### Name: sunburst
### Title: 'd3.js' Sequence Sunburst Diagrams
### Aliases: sunburst

### ** Examples

library(sunburstR)

# read in sample visit-sequences.csv data provided in source
# only use first 100 rows to speed package build and check
#   https://gist.github.com/kerryrodden/7090426#file-visit-sequences-csv
sequences <- read.csv(
  system.file("examples/visit-sequences.csv",package="sunburstR")
  ,header = FALSE
  ,stringsAsFactors = FALSE
)[1:100,]

sunburst(sequences)

## Not run: 
##D 
##D # explore some of the arguments
##D sunburst(
##D   sequences
##D   ,count = TRUE
##D )
##D 
##D sunburst(
##D   sequences
##D   # apply sort order to the legends
##D   ,legendOrder = unique(unlist(strsplit(sequences[,1],"-")))
##D   # just provide the name in the explanation in the center
##D   ,explanation = "function(d){return d.data.name}"
##D )
##D 
##D 
##D # try with json data
##D sequence_json <- jsonlite::fromJSON(
##D   system.file("examples/visit-sequences.json",package="sunburstR"),
##D   simplifyDataFrame = FALSE
##D )
##D sunburst(sequence_json)
##D 
##D 
##D 
##D # try with csv data from this fork
##D #  https://gist.github.com/mkajava/7515402
##D # great use for new breadbrumb wrapping
##D sunburst(
##D   csvdata = read.csv(
##D     file = paste0(
##D       "https://gist.githubusercontent.com/mkajava/",
##D       "7515402/raw/9f80d28094dc9dfed7090f8fb3376ef1539f4fd2/",
##D       "comment-sequences.csv"
##D     )
##D     ,header = TRUE
##D     ,stringsAsFactors = FALSE
##D   )
##D )
##D 
##D 
##D # try with csv data from this fork
##D #  https://gist.github.com/rileycrane/92a2c36eb932b4f99e51/
##D sunburst( csvdata = read.csv(
##D   file = paste0(
##D     "https://gist.githubusercontent.com/rileycrane/",
##D     "92a2c36eb932b4f99e51/raw/",
##D     "a0212b4ca8043af47ec82369aa5f023530279aa3/visit-sequences.csv"
##D   )
##D   ,header=FALSE
##D   ,stringsAsFactors = FALSE
##D ))
## End(Not run)
## Not run: 
##D #  use sunburst to analyze ngram data from Peter Norvig
##D #    http://norvig.com/mayzner.html
##D 
##D library(sunburstR)
##D library(pipeR)
##D 
##D #  read the csv data downloaded from the Google Fusion Table linked in the article
##D ngrams2 <- read.csv(
##D   system.file(
##D     "examples/ngrams2.csv"
##D     ,package="sunburstR"
##D   )
##D   , stringsAsFactors = FALSE
##D )
##D 
##D ngrams2 %>>%
##D   #  let's look at ngrams at the start of a word, so columns 1 and 3
##D   (.[,c(1,3)]) %>>%
##D   #  split the ngrams into a sequence by splitting each letter and adding -
##D   (
##D     data.frame(
##D       sequence = strsplit(.[,1],"") %>>%
##D         lapply( function(ng){ paste0(ng,collapse = "-") } ) %>>%
##D         unlist
##D       ,freq = .[,2]
##D       ,stringsAsFactors = FALSE
##D     )
##D   ) %>>%
##D   sunburst
##D 
##D 
##D library(htmltools)
##D 
##D ngrams2 %>>%
##D   (
##D     lapply(
##D       seq.int(3,ncol(.))
##D       ,function(letpos){
##D         (.[,c(1,letpos)]) %>>%
##D           #  split the ngrams into a sequence by splitting each letter and adding -
##D           (
##D             data.frame(
##D               sequence = strsplit(.[,1],"") %>>%
##D                 lapply( function(ng){ paste0(ng,collapse = "-") } ) %>>%
##D                 unlist
##D               ,freq = .[,2]
##D               ,stringsAsFactors = FALSE
##D             )
##D           ) %>>%
##D           ( tags$div(style="float:left;",sunburst( ., height = 300, width = 300 )) )
##D       }
##D     )
##D   ) %>>%
##D   tagList %>>%
##D   browsable
## End(Not run)
## Not run: 
##D   library(treemap)
##D   library(sunburstR)
##D   library(d3r)
##D 
##D   # use example from ?treemap::treemap
##D   data(GNI2014)
##D   tm <- treemap(GNI2014,
##D           index=c("continent", "iso3"),
##D           vSize="population",
##D           vColor="continent",
##D           type="index")
##D 
##D   tm_nest <- d3_nest(
##D     tm$tm[,c("continent", "iso3", "vSize", "color")],
##D     value_cols = c("vSize", "color")
##D   )
##D 
##D   sunburst(
##D     data = tm_nest,
##D     valueField = "vSize",
##D     count = TRUE,
##D     # to avoid double counting with pre-summed trees
##D     # use sumNodes = FALSE
##D     sumNodes = FALSE,
##D     colors = htmlwidgets::JS("function(d){return d3.select(this).datum().data.color;}"),
##D     withD3 = TRUE
##D   )
## End(Not run)
# calendar sunburst example

library(sunburstR)

df <- data.frame(
  date = seq.Date(
    as.Date('2014-01-01'),
    as.Date('2016-12-31'),
    by = "days"
  ),
  stringsAsFactors = FALSE
)

df$year = format(df$date, "%Y")
df$quarter = paste0("Q", ceiling(as.numeric(format(df$date,"%m"))/3))
df$month = format(df$date, "%b")
df$path = paste(df$year, df$quarter, df$month, sep="-")
df$count = rep(1, nrow(df))

sunburst(
  data.frame(xtabs(count~path,df)),
  # added a degree of difficulty by providing
  #  not easily sortable names
  sortFunction = htmlwidgets::JS(
"
function(a,b){
  abb = {
    2014:-7,
    2015:-6,
    2016:-5,
    Q1:-4,
    Q2:-3,
    Q3:-2,
    Q4:-1,
    Jan:1,
    Feb:2,
    Mar:3,
    Apr:4,
    May:5,
    Jun:6,
    Jul:7,
    Aug:8,
    Sep:9,
    Oct:10,
    Nov:11,
    Dec:12
  }
  return abb[a.data.name] - abb[b.data.name];
}
"
  )
)
# sorting example: place data in order of occurence

library(sunburstR)

df <- data.frame(
  group = c("foo", "bar", "xyz"),
  value = c(1, 3, 2)
)

sunburst(df,
         # create a trivial sort function
         sortFunction = htmlwidgets::JS('function(x) {return x;}'))

new_order <- c(3,2,1)
sunburst(df[new_order,],
         sortFunction = htmlwidgets::JS('function(x) {return x;}'))




