library(tablerDash)


### Name: tablerSocialLinks
### Title: Create a Boostrap 4 social link list
### Aliases: tablerSocialLinks

### ** Examples

if(interactive()){
 library(shiny)
 library(tablerDash)

 shiny::shinyApp(
   ui = tablerDashPage(
    navbar = NULL,
    footer = NULL,
    title = "test",
    body = tablerDashBody(
     tablerSocialLinks(
       tablerSocialLink(
        name = "facebook",
        href = "https://www.facebook.com",
        icon = "facebook"
       ),
       tablerSocialLink(
        name = "twitter",
        href = "https://www.twitter.com",
        icon = "twitter"
       )
      )
    )
   ),
   server = function(input, output) {}
 )
}




