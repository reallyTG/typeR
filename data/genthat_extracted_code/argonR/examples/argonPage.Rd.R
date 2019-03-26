library(argonR)


### Name: argonPage
### Title: Create a Boostrap 4 argon page
### Aliases: argonPage

### ** Examples

if(interactive()){
 library(argonR)
 argonPage(
  title = "ArgonR Static Template",
  author =  "Somebody",
  description = "HTML Static Template",
  navbar = argonNavbar(id = "navbar"),
  footer = argonFooter(),
  # main content
  argonSection(),
  argonSection(),
  argonSection(),
  argonSection(),
  argonSection()
 )
}




