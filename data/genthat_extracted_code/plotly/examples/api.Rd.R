library(plotly)


### Name: api_create
### Title: Tools for working with plotly's REST API (v2)
### Aliases: api_create api_create.plotly api_create.ggplot
###   api_create.data.frame api_download_plot api_download_grid api

### ** Examples


## Not run: 
##D 
##D # ------------------------------------------------------------
##D # api_create() makes it easy to upload ggplot2/plotly objects
##D # and/or data frames to your plotly account
##D # ------------------------------------------------------------
##D 
##D # A data frame creates a plotly "grid". Printing one will take you 
##D # to the it's web address so you can start creating!
##D (m <- api_create(mtcars))
##D 
##D # A plotly/ggplot2 object create a plotly "plot".
##D p <- plot_ly(mtcars, x = ~factor(vs))
##D (r <- api_create(p))
##D 
##D # api_create() returns metadata about the remote "file". Here is
##D # one way you could use that metadata to download a plot for local use:
##D fileID <- strsplit(r$file$fid, ":")[[1]]
##D layout(
##D   api_download_plot(fileID[2], fileID[1]),
##D   title = sprintf("Local version of <a href='%s'>this</a> plot", r$file$web_url)
##D )
##D 
##D ------------------------------------------------------------
##D # The api() function provides a low-level interface for performing 
##D # any action at any endpoint! It always returns a list.
##D # ------------------------------------------------------------
##D 
##D # list all the endpoints
##D api()
##D 
##D # search the entire platform!
##D # see https://api.plot.ly/v2/search
##D api("search?q=overdose")
##D api("search?q=plottype:pie trump fake")
##D 
##D # these examples will require a user account
##D usr <- Sys.getenv("plotly_username", NA)
##D if (!is.na(usr)) {
##D   # your account info https://api.plot.ly/v2/#users
##D   api(sprintf("users/%s", usr))
##D   # your folders/files https://api.plot.ly/v2/folders#user
##D   api(sprintf("folders/home?user=%s", usr))
##D }
##D 
##D # Retrieve a specific file https://api.plot.ly/v2/files#retrieve
##D api("files/cpsievert:14681")
##D 
##D # change the filename https://api.plot.ly/v2/files#update
##D # (note: this won't work unless you have proper credentials to the relevant account)
##D api("files/cpsievert:14681", "PATCH", list(filename = "toy file")) 
##D 
##D # Copy a file https://api.plot.ly/v2/files#lookup
##D api("files/cpsievert:14681/copy", "POST")
##D 
##D # Create a folder https://api.plot.ly/v2/folders#create
##D api("folders", "POST", list(path = "/starts/at/root/and/ends/here"))
##D 
## End(Not run)




