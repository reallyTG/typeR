library(MakefileR)


### Name: make_rule
### Title: Creates a Makefile rule
### Aliases: make_rule

### ** Examples

make_rule("all", c("first_target", "second_target"))
make_rule(".FORCE")
make_rule("first_target", ".FORCE", "echo 'Building first target'")
make_rule("second_target", "first_target",
 c("echo 'Building second target'", "echo 'Done'"))

makefile() +
  make_rule("all", c("first_target", "second_target")) +
  make_rule(".FORCE") +
  make_rule("first_target", ".FORCE", "echo 'Building first target'") +
  make_rule("second_target", "first_target",
    c("echo 'Building second target'", "echo 'Done'"))




