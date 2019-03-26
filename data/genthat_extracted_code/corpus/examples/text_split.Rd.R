library(corpus)


### Name: text_split
### Title: Segmenting Text
### Aliases: sentences text_nsentence text_split

### ** Examples

text <- c("I saw Mr. Jones today.", 
          "Split across\na line.",
          "What. Are. You. Doing????",
          "She asked 'do you really mean that?' and I said 'yes.'")

# split text into sentences
text_split(text, units = "sentences")

# get the number of sentences
text_nsentence(text)

# disable the default sentence suppressions
text_split("I saw Mr. Jones today.", units = "sentences", filter = NULL)

# break on CR and LF
text_split("Split across\na line.", units = "sentences",
           filter = text_filter(sent_crlf = TRUE))

# 2-sentence blocks
text_split(c("What. Are. You. Doing????",
           "She asked 'do you really mean that?' and I said 'yes.'"),
           units = "sentences", size = 2)

# 4-token blocks
text_split(c("What. Are. You. Doing????",
             "She asked 'do you really mean that?' and I said 'yes.'"),
           units = "tokens", size = 4)

# blocks are approximately evenly sized; 'size' gives maximum size
text_split(paste(letters, collapse = " "), "tokens", 4)
text_split(paste(letters, collapse = " "), "tokens", 16)



