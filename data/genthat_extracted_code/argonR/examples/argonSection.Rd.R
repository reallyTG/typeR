library(argonR)


### Name: argonSection
### Title: Create a Boostrap 4 section container
### Aliases: argonSection

### ** Examples

if (interactive()) {
 library(argonR)
 argonSection(
  size = "lg",
  status = "default",
  gradient = TRUE,
  separator = TRUE,
  separator_color = "white",
  shape = TRUE,
  argonColumn(
    argonRow(
      argonColumn(
        width = 6,
        argonH1(
          display = 3, 
          "ArgonR, HTML static template for R", 
          htmltools::span("completed with examples")
        ) %>% argonTextColor(color = "white"),
        argonLead(
          "Argon is a great free UI package based on Bootstrap 
          4 that includes the most important components and features"
        ) %>% argonTextColor(color = "white")
        ),
      argonColumn(
        width = 6,
        argonImage(
          src = "inst/images/imac.svg",
          floating = TRUE
        ) %>% argonPersp(side = "right")
        %>% argonBlur()
      )
      )
  )
 )
}




