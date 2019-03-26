library(qdapRegex)


### Name: rm_hash
### Title: Remove/Replace/Extract Hash Tags
### Aliases: rm_hash ex_hash
### Keywords: hash twitter

### ** Examples

x <- c("@hadley I like #rstats for #ggplot2 work.",
    "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats: 
        http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
    "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization 
        presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
)

rm_hash(x)
rm_hash(rm_tag(x))
ex_hash(x)

## remove just the hash symbol
rm_hash(x, replace="\\3")



