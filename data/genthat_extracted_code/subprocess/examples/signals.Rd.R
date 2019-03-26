library(subprocess)


### Name: signals
### Title: Sending signals to the child process.
### Aliases: signals signals process_terminate process_kill
###   process_send_signal SIGABRT SIGALRM SIGCHLD SIGCONT SIGFPE SIGHUP
###   SIGILL SIGINT SIGKILL SIGPIPE SIGQUIT SIGSEGV SIGSTOP SIGTERM SIGTSTP
###   SIGTTIN SIGTTOU SIGUSR1 SIGUSR2 CTRL_C_EVENT CTRL_BREAK_EVENT
### Keywords: datasets

### ** Examples

## Not run: 
##D # send the SIGKILL signal to bash
##D h <- spawn_process('bash')
##D process_signal(h, signals$SIGKILL)
##D process_signal(h, SIGKILL)
##D 
##D # is SIGABRT supported on the current platform?
##D is.na(SIGABRT)
## End(Not run)

## Not run: 
##D # Windows
##D process_send_signal(h, SIGTERM)
##D process_send_signal(h, CTRL_C_EVENT)
##D process_send_signal(h, CTRL_BREAK_EVENT)
## End(Not run)




