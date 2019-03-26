library(tablerDash)


### Name: tablerProfileCard
### Title: Create a Boostrap 4 profile card
### Aliases: tablerProfileCard

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
     tablerProfileCard(
      title = "Peter Richards",
      subtitle = "Big belly rude boy, million
      dollar hustler. Unemployed.",
      background = "https://preview.tabler.io/demo/photos/ilnur-kalimullin-218996-500.jpg",
      src = "https://preview.tabler.io/demo/faces/male/16.jpg",
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
    )
   ),
   server = function(input, output) {}
 )
}




