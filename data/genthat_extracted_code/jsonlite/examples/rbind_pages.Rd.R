library(jsonlite)


### Name: rbind_pages
### Title: Combine pages into a single data frame
### Aliases: rbind_pages

### ** Examples

# Basic example
x <- data.frame(foo = rnorm(3), bar = c(TRUE, FALSE, TRUE))
y <- data.frame(foo = rnorm(2), col = c("blue", "red"))
rbind_pages(list(x, y))

## No test: 
baseurl <- "https://projects.propublica.org/nonprofits/api/v2/search.json"
pages <- list()
for(i in 0:20){
  mydata <- fromJSON(paste0(baseurl, "?order=revenue&sort_order=desc&page=", i))
  message("Retrieving page ", i)
  pages[[i+1]] <- mydata$organizations
}
organizations <- rbind_pages(pages)
nrow(organizations)
colnames(organizations)
## End(No test)



