library(esmprep)


### Name: intolerable
### Title: intolerable
### Aliases: intolerable

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute intolerable. Start --------------
# RELEVANTINFO_ES is delivered with the package
# expectedDf is a raw ESM dataset, delivered with the package.
# Prerequisites in order to execute intolerable. End ----------------
# -------------------------------------------------------
# Run function 23 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# Generate second argument of function 'intolerable'
(intoleranceDf <- data.frame(
# Column 'prompt': Prompts that must NEVER be comined with expected categories.
prompt = c(2, 3, 4, 1, 1),
# Column 'expect': Expected categories that must NEVER be combined with the prompts.
expect = c(1, 1, 1, 2, 3)))
# Read: Prompts 2, 3, and 4 must never be combined with expected category 1.
# Read: Prompt 1 must never be combined with expected category 2.
# Read: Prompt 1 must never be combined with expected category 3.
# expectedDf is the result of function 'expectedPromptIndex'.
intolLs <- intolerable(expectedDf, intoleranceDf, RELEVANTINFO_ES)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



