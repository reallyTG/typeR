library(soundgen)


### Name: wiggleAnchors
### Title: Randomly modify anchors
### Aliases: wiggleAnchors
### Keywords: internal

### ** Examples

soundgen:::wiggleAnchors(df = data.frame(
  time = c(0, .1, .8, 1), value = c(100, 230, 180, 90)),
  temperature = .2, temp_coef = .1, low = c(0, 50), high = c(1, 1000),
  wiggleAllRows = FALSE) # pitch
soundgen:::wiggleAnchors(df = data.frame(time = 0, value = 240),
  temperature = .2, temp_coef = .1, low = c(0, 50), high = c(1, 1000),
  wiggleAllRows = FALSE) # pitch, single anchor
soundgen:::wiggleAnchors(df = data.frame(
  time = c(-100, 100, 600, 900), value = c(-120, -80, 0, -120)),
  temperature = .4, temp_coef = .5, low = c(-Inf, -120), high = c(+Inf, 30),
  wiggleAllRows = TRUE) # noise
# formants
formants = list(f1 = list(time = 0, freq = 860, amp = 30, width = 120),
                f2 = list(time = c(0,1), freq = 1280,
                amp = c(10,40), width = 120))
for (f in 1:length(formants)) {
  formants[[f]] = soundgen:::wiggleAnchors(
    df = formants[[f]],
    temperature = .4, temp_coef = .5,
    low = c(0, 50, 0, 1),
    high = c(1, 8000, 120, 2000),
    wiggleAllRows = FALSE
  )
}
print(formants)

# manually provided sd (temp only affects prob of adding/dropping anchors)
soundgen:::wiggleAnchors(df = data.frame(
  time = c(0, .1, .8, 1), value = c(100, 230, 180, 90)),
  wiggleAllRows = FALSE, sd_values = 5)



