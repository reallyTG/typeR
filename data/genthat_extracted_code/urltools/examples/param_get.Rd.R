library(urltools)


### Name: param_get
### Title: get the values of a URL's parameters
### Aliases: param_get url_parameter

### ** Examples

#A very simple example
url <- "https://google.com:80/foo.php?this_parameter=selfreferencing&hiphop=awesome"
parameter_values <- param_get(url, c("this_parameter","hiphop"))




