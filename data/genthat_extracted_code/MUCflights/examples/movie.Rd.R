library(MUCflights)


### Name: movie
### Title: function to generate a movie of flight data
### Aliases: movie movie.routes ffmpeg
### Keywords: movie

### ** Examples

  myflights <- flights(from = "2011-01-07 11:55:00", 
                       to = "2011-01-07 12:05:00")
  myroutes <- routes(myflights)
  movie(myroutes, save = FALSE, NightDay = TRUE)



