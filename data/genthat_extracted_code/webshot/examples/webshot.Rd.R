library(webshot)


### Name: webshot
### Title: Take a screenshot of a URL
### Aliases: webshot

### ** Examples

if (interactive()) {

# Whole web page
webshot("https://github.com/rstudio/shiny")

# Might need a longer delay for all assets to display
webshot("http://rstudio.github.io/leaflet", delay = 0.5)

# One can also take screenshots of several URLs with only one command.
# This is more efficient than calling 'webshot' multiple times.
webshot(c("https://github.com/rstudio/shiny",
          "http://rstudio.github.io/leaflet"),
        delay = 0.5)

# Clip to the viewport
webshot("http://rstudio.github.io/leaflet", "leaflet-viewport.png",
        cliprect = "viewport")

# Manual clipping rectangle
webshot("http://rstudio.github.io/leaflet", "leaflet-clip.png",
        cliprect = c(200, 5, 400, 300))

# Using CSS selectors to pick out regions
webshot("http://rstudio.github.io/leaflet", "leaflet-menu.png", selector = ".list-group")
webshot("http://reddit.com/", "reddit-top.png",
        selector = c("input[type='text']", "#header-bottom-left"))

# Expand selection region
webshot("http://rstudio.github.io/leaflet", "leaflet-boxes.png",
        selector = "#installation", expand = c(10, 50, 0, 50))

# If multiple matches for a given selector, it uses the first match
webshot("http://rstudio.github.io/leaflet", "leaflet-p.png", selector = "p")
webshot("https://github.com/rstudio/shiny/", "shiny-stats.png",
         selector = "ul.numbers-summary")

# Send commands to eval
webshot("http://www.reddit.com/", "reddit-input.png",
  selector = c("#search", "#login_login-main"),
  eval = "casper.then(function() {
    // Check the remember me box
    this.click('#rem-login-main');
    // Enter username and password
    this.sendKeys('#login_login-main input[type=\"text\"]', 'my_username');
    this.sendKeys('#login_login-main input[type=\"password\"]', 'password');

    // Now click in the search box. This results in a box expanding below
    this.click('#search input[type=\"text\"]');
    // Wait 500ms
    this.wait(500);
  });"
)

# Result can be piped to other commands like resize() and shrink()
webshot("https://www.r-project.org/", "r-small.png") %>%
 resize("75%") %>%
 shrink()

# Requests can change the User-Agent header
webshot(
  "https://www.rstudio.com/products/rstudio/download/",
  "rstudio.png",
  useragent = "Mozilla/5.0 (Macintosh; Intel Mac OS X)"
)

# See more examples in the package vignette
}




