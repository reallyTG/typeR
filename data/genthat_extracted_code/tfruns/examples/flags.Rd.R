library(tfruns)


### Name: flags
### Title: Flags for a training run
### Aliases: flags flag_numeric flag_integer flag_boolean flag_string

### ** Examples

## Not run: 
##D library(tfruns)
##D 
##D # define flags and parse flag values from flags.yml and the command line
##D FLAGS <- flags(
##D   flag_numeric('learning_rate', 0.01, 'Initial learning rate.'),
##D   flag_integer('max_steps', 5000, 'Number of steps to run trainer.'),
##D   flag_string('data_dir', 'MNIST-data', 'Directory for training data'),
##D   flag_boolean('fake_data', FALSE, 'If true, use fake data for testing')
##D )
## End(Not run)




