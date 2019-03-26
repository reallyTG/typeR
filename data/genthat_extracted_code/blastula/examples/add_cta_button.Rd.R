library(blastula)


### Name: add_cta_button
### Title: Helper function for adding a CTA button
### Aliases: add_cta_button

### ** Examples

# Create the button as an HTML fragment
cta_button <-
  add_cta_button(
    url = "http://www.website.net",
    text = "Press This Button")

# Include the button in the email
# message body by simply referencing
# the `cta_button` object
email <-
  compose_email(
    body = "
    Hello!

    Below is a call. It's a call \\
    to action. Press it!

    {cta_button}

    Cheers
    ")



