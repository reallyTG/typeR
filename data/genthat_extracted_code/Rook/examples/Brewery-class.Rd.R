library(Rook)


### Name: Brewery-class
### Title: Class 'Brewery'
### Aliases: Brewery-class Brewery
### Keywords: classes

### ** Examples


#
# This application runs any file found in tempdir() through brew.
#
s <- Rhttpd$new()
## Not run: 
##D s$start(quiet=TRUE)
## End(Not run)
cat("<h1>Random Number: <%=rnorm(1)%></h1>",
    file=file.path(tempdir(),"index.html"))
s$add(name="random",
    app=Builder$new(
        Brewery$new(url="/",root=tempdir()),
        Redirect$new("/index.html")
    )
)
## Not run: 
##D s$browse('random') # Opens a browser window to the app.
## End(Not run)
file.remove(file.path(tempdir(),"index.html"))
s$remove(all=TRUE)
rm(s)



