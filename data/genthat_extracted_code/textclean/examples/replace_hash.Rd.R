library(textclean)


### Name: replace_hash
### Title: Replace Hashes
### Aliases: replace_hash

### ** Examples

x <- c("@hadley I like #rstats for #ggplot2 work.",
    "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats: 
        http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
    "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization 
        presentation #user2014. http://ramnathv.github.io/user2014-rcharts/#1"
)

replace_hash(x)
replace_hash(x, replacement = '<<HASH>>')
replace_hash(x, replacement = '$3')

## Replacement with a function
replace_hash(x, 
    replacement = function(x){
        paste0('{{', gsub('^#', 'TOPIC: ', x), '}}')
    }
)



