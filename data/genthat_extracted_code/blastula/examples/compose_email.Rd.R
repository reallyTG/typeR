library(blastula)


### Name: compose_email
### Title: Create the email message
### Aliases: compose_email

### ** Examples

# Create a simple email message using
# Markdown formatting
email <-
  compose_email(
  body = "
  Hello!

  ## This a section heading

  We can use Markdown formatting \\
  to **embolden** text or to add \\
  *emphasis*. This is exciting, \\
  right?

  Cheers")

# The email message can always be
# previewed using `preview_email()`
preview_email(email = email)

# We can use string interpolation to
# add in R code or strings assigned
# to variables; variables can be
# obtained from the global workspace
# or from temporary variables in the
# function call
sender_name <- "Mike"

email <-
  compose_email(
  body = "
  Hello!

  I just wanted to let you \\
  know that the {thing} that \\
  asked me for is ready to \\
  pick up. So, come over and \\
  do that.

  Cheers,

  {sender_name}",
  thing = "report")



