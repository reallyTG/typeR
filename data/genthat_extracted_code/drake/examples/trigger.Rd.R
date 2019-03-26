library(drake)


### Name: trigger
### Title: Customize the decision rules for rebuilding targets
### Aliases: trigger

### ** Examples

# A trigger is just a set of decision rules
# to decide whether to build a target.
trigger()
# This trigger will build a target on Tuesdays
# and when the value of an online dataset changes.
trigger(condition = today() == "Tuesday", change = get_online_dataset())
## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # You can use a global trigger argument:
##D # for example, to always run everything.
##D make(my_plan, trigger = trigger(condition = TRUE))
##D make(my_plan, trigger = trigger(condition = TRUE))
##D # You can also define specific triggers for each target.
##D plan <- drake_plan(
##D   x = sample.int(15),
##D   y = target(
##D     command = x + 1,
##D     trigger = trigger(depend = FALSE)
##D   )
##D )
##D # Now, when x changes, y will not.
##D make(plan)
##D make(plan)
##D plan$command[1] <- "sample.int(16)" # change x
##D make(plan)
##D })
## End(Not run)



