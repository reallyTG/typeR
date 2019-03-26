library(qdapRegex)


### Name: rm_tag
### Title: Remove/Replace/Extract Person Tags
### Aliases: rm_tag ex_tag
### Keywords: person tag twitter

### ** Examples

x <- c("@hadley I like #rstats for #ggplot2 work.",
    "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats:
        http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
    "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization
        presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1",
    "tyler.rinker@gamil.com is my email", 
    "A non valid Twitter is @abcdefghijklmnopqrstuvwxyz"
)

rm_tag(x)
rm_tag(rm_hash(x))
ex_tag(x)

## more restrictive Twitter regex
ex_tag(x, pattern="@rm_tag2") 

## Remove only the @ sign
rm_tag(x, replacement = "\\3")
rm_tag(x, replacement = "\\3", pattern="@rm_tag2")



