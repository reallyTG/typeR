library(textclean)


### Name: replace_emoticon
### Title: Replace Emoticons With Words
### Aliases: replace_emoticon
### Keywords: emoticon

### ** Examples

x <- c(
    paste(
        "text from:", 
        "http://www.webopedia.com/quick_ref/textmessageabbreviations_02.asp"
    ),
    "... understanding what different characters used in smiley faces mean:",
    "The close bracket represents a sideways smile  )",
    "Add in the colon and you have sideways eyes   :",
    "Put them together to make a smiley face  :)",
    "Use the dash -  to add a nose   :-)",
    paste(
        "Change the colon to a semi-colon ;", 
        "and you have a winking face ;)  with a nose  ;-)"
    ),
    paste(
        "Put a zero 0 (halo) on top and now you have a winking,", 
        "smiling angel 0;) with a nose 0;-)"
    ),
    "Use the letter 8 in place of the colon for sunglasses 8-)",
    "Use the open bracket ( to turn the smile into a frown  :-("
)

replace_emoticon(x)



