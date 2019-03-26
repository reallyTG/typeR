library(argonR)


### Name: argonProfile
### Title: Create a Boostrap 4 profile card
### Aliases: argonProfile

### ** Examples

if(interactive()){
 library(argonR)
 argonProfile(
  title = "John",
  subtitle = "Japan, Kagoshima",
  src = "https://image.flaticon.com/icons/svg/1006/1006540.svg",
  url = "https://www.google.com",
  url_1 = "https://www.google.com",
  url_2 = "https://www.google.com",
  stats = argonProfileStats(
    argonProfileStat(
      value = 22,
      description = "Friends"
    ),
    argonProfileStat(
      value = 10,
      description = "Photos"
    ),
    argonProfileStat(
      value = 89,
      description = "Comments"
    )
  ),
  "An artist of considerable range, Ryan — 
  the name taken by Melbourne-raised, 
  Brooklyn-based Nick Murphy — writes, 
  performs and records all of his own music, 
  giving it a warm, intimate feel with a solid 
  groove structure. An artist of considerable 
  range."
 )
}




