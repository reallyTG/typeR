## ---- warning=FALSE, message=FALSE---------------------------------------
# load the library
library(childesr)

## ------------------------------------------------------------------------
d_transcripts <- get_transcripts()
head(d_transcripts)

## ------------------------------------------------------------------------
d_eng_na <- get_transcripts(collection = "Eng-NA")
head(d_eng_na)

## ------------------------------------------------------------------------
# returns all transcripts in the brown corpus
d_brown_transcripts <- get_transcripts(corpus = "Brown")
# print the number of rows
nrow(d_brown_transcripts)

## ------------------------------------------------------------------------
d_many_corpora <- get_transcripts(corpus = c("Brown", "Clark"))
# print the number of rows
nrow(d_many_corpora)

## ------------------------------------------------------------------------
d_shem <- get_transcripts(corpus = c("Brown", "Clark"),
                          target_child = "Shem")
# print the number of rows
nrow(d_shem)

## ------------------------------------------------------------------------
d_participants <- get_participants()
head(d_participants)

## ------------------------------------------------------------------------
d_target_child <- get_participants(role = "target_child")
head(d_target_child)

## ------------------------------------------------------------------------
d_age_range <- get_participants(age = c(24, 36))
head(d_age_range)

## ------------------------------------------------------------------------
d_adam_prod <- get_tokens(corpus = "Brown",
                          role = "target_child",
                          target_child = "Adam",
                          token = c("dog", "ball"))

# view the structure of the data
str(d_adam_prod)

# print the unique tokens
unique(d_adam_prod$gloss)

## ------------------------------------------------------------------------
d_adam_types <- get_types(corpus = "Brown",
                          target_child = "Adam",
                          role = "target_child",
                          type = c("dog", "ball"))

# print the number of times ball appears in the first transcript
c(d_adam_types$gloss[1], d_adam_types$count[1])

## ------------------------------------------------------------------------
d_adam_utts <- get_utterances(corpus = "Brown",
                              target_child = "Adam")

# view the structure of the data
str(d_adam_utts)

# print the first five utterances
d_adam_utts$gloss[1:5]

## ------------------------------------------------------------------------
d_adam_stats <- get_speaker_statistics(corpus = "Brown",
                                       target_child = "Adam",
                                       role = "target_child")

# get the average mlu across all Adam's transcripts
mean(d_adam_stats$mlu_w)

