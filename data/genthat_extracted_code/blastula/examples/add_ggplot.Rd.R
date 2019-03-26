library(blastula)


### Name: add_ggplot
### Title: Helper function for adding an ggplot
### Aliases: add_ggplot

### ** Examples

library(ggplot2)

# Create a ggplot plot
plot <-
  ggplot(
    data = mtcars,
    aes(x = disp, y = hp,
        color = wt, size = mpg)) +
  geom_point()

# Create an HTML fragment that
# contains an the ggplot as an
# embedded plot
plot_html <-
  add_ggplot(
    plot_object = plot,
    height = 5,
    width = 7)

# Include the plot in the email
# message body by simply referencing
# the `plot_html` object
email <-
  compose_email(
  body = "
  Hello!

  Here is a very important plot \\
  that will change the way you \\
  look at cars forever.

  {plot_html}

  So useful, right?
  ") %>% preview_email()



