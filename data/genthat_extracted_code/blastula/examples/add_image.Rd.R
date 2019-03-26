library(blastula)


### Name: add_image
### Title: Helper function for adding an image
### Aliases: add_image

### ** Examples

# Create an HTML fragment that
# contains an image
img_file_path <-
  system.file(
    "img",
    "test_image.png",
    package = "blastula")

img_file_html <-
  add_image(
    file = img_file_path)

# Include the image in the email
# message body by simply referencing
# the `img_file_html` object
email <-
  compose_email(
    body = "
    Hello!

    Here is an image:

    {img_file_html}
    ")



