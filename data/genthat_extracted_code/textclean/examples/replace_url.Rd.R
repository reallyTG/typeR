library(textclean)


### Name: replace_url
### Title: Replace URLs
### Aliases: replace_url

### ** Examples

x <- c("@hadley I like #rstats for #ggplot2 work. ftp://cran.r-project.org/incoming/",
    "Difference between #magrittr and #pipeR, both implement pipeline operators for #rstats: 
        http://renkun.me/r/2014/07/26/difference-between-magrittr-and-pipeR.html @timelyportfolio",
    "Slides from great talk: @ramnath_vaidya: Interactive slides from Interactive Visualization 
        presentation #user2014. https://ramnathv.github.io/user2014-rcharts/#1",
    NA 
)

replace_url(x)
replace_url(x, replacement = '<<URL>>')

## Not run: 
##D ## Replacement with a function
##D library(urltools)
##D replace_url(x, 
##D     replacement = function(x){
##D         sprintf('{{%s}}', urltools::url_parse(x)$domain)
##D     }
##D )
## End(Not run)



