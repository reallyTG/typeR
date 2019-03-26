library(argonR)


### Name: argonTooltip
### Title: Create a boostrap 4 tooltip
### Aliases: argonTooltip

### ** Examples

if (interactive()) {
 library(argonR)
 argonTooltip(
  position = "left", 
  title = "I am a nice card",
  argonCard(
   status = "primary",
   width = 12,
   title = "Card 1",
   hover_lift = TRUE,
   shadow = TRUE,
   icon = "check-bold",
   src = "#",
   "Argon is a great free UI package based on Bootstrap 4 
   that includes the most important components and features."
  )
 )
}




