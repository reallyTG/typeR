library(argonR)


### Name: argonNavbar
### Title: Create a Boostrap 4 argon navbar
### Aliases: argonNavbar

### ** Examples

if(interactive()){
 library(argonR)
 argonNavbar(
  id = "main-navbar",
  src = "https://demos.creative-tim.com/argon-design-system/assets/img/brand/white.png",
  # left menu
  argonNavMenu(
    argonDropdown(
      name = "Components",
      size = "lg",
      argonDropdownItem(
        name = "Getting Started",
        description = "BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla",
        src = "test.html",
        icon = "spaceship",
        status = "primary"
      ),
      argonDropdownItem(
        name = "Foundation",
        description = "BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla",
        src = "",
        icon = "palette",
        status = "warning"
      ),
      argonDropdownItem(
        name = "Components",
        description = "BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla",
        src = "",
        icon = "ui-04",
        status = "success"
      )
    )
  ),
  # right menu
  argonNavMenu(
    side = "right",
    argonNavItem(
      name = "facebook",
      src = "https://www.facebook.com",
      icon = "facebook-square",
      tooltip = "Like us on Facebook"
    ),
    argonNavItem(
      name = "instagram",
      src = "https://www.instagram.com",
      icon = "instagram",
      tooltip = "Follow us on Instagram"
    ),
    argonNavItem(
      name = "twitter",
      src = "https://www.twitter.com",
      icon = "twitter-square",
      tooltip = "Follow us on Twitter"
    ),
    argonNavItem(
      name = "github",
      src = "https://www.github.com",
      icon = "github",
      tooltip = "Star us on Github"
    )
  )
 )
}




