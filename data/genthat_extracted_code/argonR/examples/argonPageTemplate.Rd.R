library(argonR)


### Name: argonPageTemplate
### Title: Create an HTML version of the argonPage
### Aliases: argonPageTemplate

### ** Examples

if(interactive()){
 library(argonR)
 
 # generate the page
 example <- argonPage(
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
 
 # create the path
 path <- getwd()
 
 # generate the static page
 argonPageTemplate(filename = "example", path = path, argonPage = example)
 
}




