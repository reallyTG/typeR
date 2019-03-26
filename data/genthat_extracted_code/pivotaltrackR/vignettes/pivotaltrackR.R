## ---- include=FALSE------------------------------------------------------
library(httptest)
library(magrittr)
start_vignette("stories")

## ------------------------------------------------------------------------
options(pivotal.project=995640)

## ------------------------------------------------------------------------
library(pivotaltrackR)

## ------------------------------------------------------------------------
bugs <- getStories(story_type="bug")
bugs

## ---- include=FALSE------------------------------------------------------
change_state()

## ------------------------------------------------------------------------
new_bug <- createStory(
    name="Flux capacitor hangs at 0.9 gigawatts",
    description="Everything seems fine up to then but then it gets stuck. Please investigate and fix.",
    story_type="bug"
)
new_bug

## ---- include=FALSE------------------------------------------------------
Sys.sleep(1) ## So that Pivotal's API can catch up with us!

## ------------------------------------------------------------------------
getStories(story_type="bug")

## ---- include=FALSE------------------------------------------------------
change_state()

## ------------------------------------------------------------------------
new_bug <- editStory(new_bug, current_state="started")
getStories(story_type="bug")

## ---- include=FALSE------------------------------------------------------
change_state()

## ------------------------------------------------------------------------
deleteStory(new_bug)
getStories(story_type="bug")

## ---- include=FALSE------------------------------------------------------
end_vignette()

