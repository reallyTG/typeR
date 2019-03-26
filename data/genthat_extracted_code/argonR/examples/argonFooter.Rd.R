library(argonR)


### Name: argonFooter
### Title: Create a Boostrap 4 argon footer
### Aliases: argonFooter

### ** Examples

if(interactive()){
 library(argonR)
 argonFooter(
  has_card = FALSE,
  argonContainer(
    size = "lg",
    argonRow(
      argonColumn(
        width = 6,
        argonIconWrapper(
          iconTag = argonIcon("atom"),
          size = "lg",
          status = "success",
          shadow = TRUE,
          hover_shadow = TRUE
        ),
        argonH1(
          display = 3,
          "Insert anything in the footer"
        ),
        argonLead(
          "The Arctic Ocean freezes every winter and much of 
          the sea-ice then thaws every summer, and that process 
          will continue whatever"
        )
        ),
      argonColumn(
        width = 6,
        argonCarousel(
          width = 12,
          id = "carousel2",
          argonCarouselItem(
            src = "http://www.72pxdesigns.com/wp-content/uploads/2017/06/preview-814162.png",
            active = TRUE
          ),
          argonCarouselItem(
            src = "http://www.72pxdesigns.com/wp-content/uploads/2017/06/preview-814162.png",
            active = FALSE
          )
        )
      )
    )
   )
 )
}




